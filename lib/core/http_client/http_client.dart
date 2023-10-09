import 'dart:io';

abstract class HttpClient {
  Future<HttpResponse> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
