import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/data/services/chat%20service/chat_service.dart';
import 'package:salvest_app/utility/app_colors.dart';

class ChatScreen extends StatefulWidget {
  final String otherUserId;
  final String otherUserName;

  const ChatScreen({
    required this.otherUserId,
    required this.otherUserName,
    Key? key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  String _chatRoomId = '';
  late String _currentUserId;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser!.uid;
    _initializeChatRoom();
  }

  Future<void> _initializeChatRoom() async {
    _chatRoomId = await _chatService.createChatRoom(
      _currentUserId,
      widget.otherUserId,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          widget.otherUserName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
          _chatRoomId.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: _chatService.getMessages(_chatRoomId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final messages = snapshot.data!;
                        // Sort messages by timestamp in ascending order
                        messages.sort((a, b) {
                          final aTimestamp =
                              a['timestamp'] as Timestamp? ?? Timestamp.now();
                          final bTimestamp =
                              b['timestamp'] as Timestamp? ?? Timestamp.now();
                          return aTimestamp.compareTo(bTimestamp);
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_scrollController.hasClients) {
                            _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent,
                            );
                          }
                        });

                        return ListView(
                          controller: _scrollController,
                          reverse: false, // Changed to false
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          children:
                              messages.map((message) {
                                final isMe =
                                    message['senderId'] == _currentUserId;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Align(
                                    alignment:
                                        isMe
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      constraints: const BoxConstraints(
                                        maxWidth: 267,
                                      ),
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x4C000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                        color:
                                            isMe
                                                ? const Color(0x265B5B5B)
                                                : const Color(0xAD9A8AEC),
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(19),
                                          topRight: const Radius.circular(19),
                                          bottomLeft:
                                              isMe
                                                  ? const Radius.circular(19)
                                                  : const Radius.circular(0),
                                          bottomRight:
                                              isMe
                                                  ? const Radius.circular(0)
                                                  : const Radius.circular(19),
                                        ),
                                      ),
                                      child: Text(
                                        message['text'],
                                        style: TextStyle(
                                          color:
                                              isMe
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        );
                      },
                    ),
                  ),
                  // Message Input Field
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0x4F786CB9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'message.....',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Color(0xFF786CB9),
                            ),
                            onPressed: () async {
                              if (_messageController.text.trim().isNotEmpty) {
                                await _chatService.sendMessage(
                                  chatRoomId: _chatRoomId,
                                  senderId: _currentUserId,
                                  text: _messageController.text.trim(),
                                );
                                _messageController.clear();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
