import 'http_response_model.dart';

abstract class HttpClient {
  Future<HttpResponseModel> get<T>(String path);

  Future<HttpResponseModel> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponseModel> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponseModel> delete<T>(String path);
}
