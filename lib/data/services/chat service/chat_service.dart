import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000',
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  Future<String> createChatRoom(
    String currentUserId,
    String otherUserId,
  ) async {
    // Create a unique chat room ID sorted by user IDs
    final chatRoomId = [currentUserId, otherUserId]..sort();
    final roomId = chatRoomId.join('_');

    // Check if chat room already exists
    final room = await _firestore.collection('chatRooms').doc(roomId).get();

    if (!room.exists) {
      await _firestore.collection('chatRooms').doc(roomId).set({
        'participants': [currentUserId, otherUserId],
        'createdAt': FieldValue.serverTimestamp(),
        'lastMessage': '',
        'lastMessageTime': FieldValue.serverTimestamp(),
      });
    }

    return roomId;
  }
  Stream<List<Map<String, dynamic>>> getChatRooms(String userId) {
    return _firestore
        .collection('chatRooms')
        .where('participants', arrayContains: userId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) {
                final data = doc.data();
                return {'id': doc.id, ...data};
              }).toList(),
        );
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String text,
  }) async {
    await _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add({
          'senderId': senderId,
          'text': text,
          'timestamp': FieldValue.serverTimestamp(),
        });

    // Update last message in chat room
    await _firestore.collection('chatRooms').doc(chatRoomId).update({
      'lastMessage': text,
      'lastMessageTime': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Map<String, dynamic>>> getMessages(String chatRoomId) {
    return _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) {
                final data = doc.data();
                return {'id': doc.id, ...data};
              }).toList(),
        );
  }

  Future<void> sendMessageToApi({
    required String chatRoomId,
    required String senderId,
    required String text,
  }) async {
    // First validate parameters
    if (chatRoomId.isEmpty || senderId.isEmpty || text.isEmpty) {
      throw ArgumentError('All parameters must be non-empty');
    }

    try {
      print('Attempting to send message to API...');

      final stopwatch = Stopwatch()..start();

      final response = await _dio.post(
        '/chat/message',
        data: jsonEncode({
          'chatRoomId': chatRoomId,
          'senderId': senderId,
          'text': text,
        }),
        options: Options(validateStatus: (status) => status! < 500),
      );

      stopwatch.stop();
      print('API call completed in ${stopwatch.elapsedMilliseconds}ms');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Message sent successfully');
        return;
      }

      // Handle specific error cases
      if (response.statusCode == 401) {
        throw Exception('Authentication failed');
      } else if (response.statusCode == 404) {
        throw Exception('Endpoint not found');
      } else {
        throw Exception(
          'API request failed with status ${response.statusCode}: ${response.data}',
        );
      }
    } on DioException catch (e) {
      // Handle specific Dio error types
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception(
            'Connection timeout. Please check your internet connection.',
          );
        case DioExceptionType.sendTimeout:
          throw Exception(
            'Send timeout. The server is taking too long to respond.',
          );
        case DioExceptionType.receiveTimeout:
          throw Exception(
            'Receive timeout. The server is taking too long to respond.',
          );
        case DioExceptionType.badCertificate:
          throw Exception('Bad certificate. SSL verification failed.');
        case DioExceptionType.badResponse:
          throw Exception(
            'Bad response from server: ${e.response?.statusCode}',
          );
        case DioExceptionType.cancel:
          throw Exception('Request was cancelled');
        case DioExceptionType.connectionError:
          throw Exception(
            'Connection error. Please check your internet connection.',
          );
        case DioExceptionType.unknown:
          throw Exception('Unknown error occurred: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error type: ${e.runtimeType}');
      rethrow;
    }
  }
}
