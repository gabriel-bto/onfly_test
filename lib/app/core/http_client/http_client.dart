import 'package:http/http.dart';

abstract class HttpClient {
  Future<Response> get<T>(String path);

  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> delete<T>(String path);
}
