import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import '../storage/token_storage.dart';

class ApiClient {
  static const String baseUrl = 'https://smart-vert-app.onrender.com';

  final Dio dio;
  final TokenStorage _tokenStorage;

  ApiClient(this._tokenStorage) : dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    headers: {'Content-Type': 'application/json'},

  )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    // Logs every request/response to the console. Remove before release.
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  /// Converts Dio's errors into our own exception types.
  Never handleError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          throw const NetworkException('Connection timed out. Try again.');
        case DioExceptionType.connectionError:
          throw const NetworkException();
        default:
          throw ServerException(
            _extractMessage(error.response?.data) ?? 'Something went wrong',
            statusCode: error.response?.statusCode,
          );
      }
    }
    throw const ServerException('Something went wrong');
  }

  /// Pulls a human-readable message out of the server's error body.
  /// We'll adjust this once we see the actual error shape in the spec.
  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return (data['message'] ?? data['error'] ?? data['detail']) as String?;
    }
    return null;
  }
}