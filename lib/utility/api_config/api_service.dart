import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:salvest_app/utility/enums.dart';

class HelperResponse {
  Map<String, dynamic>? fullBody;
  String response;

  ServicesResponseStatues servicesResponse;
  HelperResponse({
    this.response = '',
    required this.servicesResponse,
    required this.fullBody,
  });

  HelperResponse copyWith({
    Map<String, dynamic>? fullBody,
    String? response,
    ServicesResponseStatues? servicesResponse,
  }) => HelperResponse(
    fullBody: fullBody ?? this.fullBody,
    response: response ?? this.response,
    servicesResponse: servicesResponse ?? this.servicesResponse,
  );
}

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<HelperResponse> post({
    required String endpoint,
    dynamic data,
    String? token,
  }) async {
    bool isFormData = data is FormData;

    _dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Cache-Control': 'no-cache',
      "Connection": "Keep-Alive",
      'Accept': 'application/json',
      "Keep-Alive": "timeout=15, max=10",
      if (!isFormData) 'Content-Type': 'application/json',
    };

    try {
      var response = await _dio.post(endpoint, data: data);
      print('iiiisss');
      print(data);
      print("Response data: ${response.data}"); // Debug log

      return HelperResponse(
        fullBody: response.data is Map ? response.data : {"raw": response.data},
        response: response.data.toString(),
        servicesResponse: ServicesResponseStatues.success,
      );
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");

      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: e.response?.data ?? {"message": "Unauthorized"},
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      return HelperResponse(
        fullBody: e.response?.data ?? {"error": "Something went wrong"},
        response:
            e.response?.data['errors']?.toString() ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (_) {
      return HelperResponse(
        fullBody: {"error": "No internet connection"},
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  Future<HelperResponse> get({
    required String endpoint,
    Map<String, dynamic>? query,
    dynamic data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Authorization': 'Bearer $token',
      "Connection": "Keep-Alive",
      'Cache-Control': 'no-cache',
      "Keep-Alive": "timeout=15, max=10",
    };

    try {
      var response = await _dio.get(
        data: data,
        endpoint,
        queryParameters: query ?? {},
      );
      return HelperResponse(
        fullBody: data,
        response: response.data.toString(),
        servicesResponse: ServicesResponseStatues.success,
      );
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");

      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: data,
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      return HelperResponse(
        fullBody: data,
        response:
            e.response?.data['message'] ?? e.message ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (_) {
      return HelperResponse(
        fullBody: data,
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  Future<HelperResponse> postPropertyData({
    required String url,
    required dynamic body,
    bool useUserToken = false,
    List<File> propertyImages = const [],
    List<File> idImages = const [],
    List<File> propertyDocuments = const [],
    String? token,
  }) async {
    try {
      // Create FormData for the request
      final formData = FormData.fromMap(body);

      // Helper function to add files
      void addFiles(String fieldName, List<File> files) async {
        for (final file in files) {
          formData.files.add(
            MapEntry(
              fieldName,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      // Add all file types
      addFiles('property_images[]', propertyImages);
      addFiles('id_images[]', idImages);
      addFiles('property_documents[]', propertyDocuments);

      // Set headers
      final headers = {
        'Accept': 'application/json',
        'Cache-Control': 'no-cache',
        'Connection': 'Keep-Alive',
        'Keep-Alive': 'timeout=15, max=10',
        if (!useUserToken) 'Content-Type': 'application/json',
      };

      // Add authorization if needed
      if (useUserToken) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Make the request
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: headers),
      );

      // Handle successful response
      if (response.statusCode == 200) {
        return HelperResponse(
          fullBody:
              response.data is Map ? response.data : {'raw': response.data},
          response: response.data.toString(),
          servicesResponse: ServicesResponseStatues.success,
        );
      }

      // Handle 401 unauthorized
      if (response.statusCode == 401) {
        return HelperResponse(
          fullBody: response.data ?? {'message': 'Unauthorized'},
          response: response.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      // Handle other errors
      return HelperResponse(
        fullBody: response.data ?? {'error': 'Something went wrong'},
        response: response.data['message'] ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on DioException catch (e) {
      print('Dio error: ${e.response?.data}');

      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: e.response?.data ?? {'message': 'Unauthorized'},
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      return HelperResponse(
        fullBody: e.response?.data ?? {'error': e.toString()},
        response:
            e.response?.data['message'] ?? e.message ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (_) {
      return HelperResponse(
        fullBody: {'error': 'No internet connection'},
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  Future<HelperResponse> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await _dio.delete(endpoint, data: data);
      return HelperResponse(
        fullBody: data,
        response: response.data.toString(),
        servicesResponse: ServicesResponseStatues.success,
      );
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");

      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: data,
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      return HelperResponse(
        fullBody: data,
        response:
            e.response?.data['message'] ?? e.message ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (_) {
      return HelperResponse(
        fullBody: data,
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }

  Future<HelperResponse> put({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await _dio.put(endpoint, data: data);
      return HelperResponse(
        fullBody: data,
        response: response.data.toString(),
        servicesResponse: ServicesResponseStatues.success,
      );
    } on DioException catch (e) {
      print("Dio error: ${e.response?.data}");

      if (e.response?.statusCode == 401) {
        return HelperResponse(
          fullBody: data,
          response: e.response?.data['message'] ?? 'Unauthorized',
          servicesResponse: ServicesResponseStatues.unauthorized,
        );
      }

      return HelperResponse(
        fullBody: data,
        response:
            e.response?.data['message'] ?? e.message ?? 'Something went wrong',
        servicesResponse: ServicesResponseStatues.someThingWrong,
      );
    } on SocketException catch (_) {
      return HelperResponse(
        fullBody: data,
        response: 'No internet connection',
        servicesResponse: ServicesResponseStatues.networkError,
      );
    }
  }
}
