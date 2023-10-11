import '../utils/api_utils.dart';
import 'http_client.dart';
import 'package:dio/dio.dart';

import 'http_response_model.dart';

class HttpClientImplementation implements HttpClient {
  final client = Dio(BaseOptions(
    baseUrl: ApiUtils.baseURL,
    headers: ApiUtils.headers,
  ));

  @override
  Future<HttpResponseModel> get<T>(String path) async {
    final response = await client.get(path);

    return HttpResponseModel(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.post(
      path,
      queryParameters: queryParameters,
    );

    return HttpResponseModel(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.patch(
      path,
      queryParameters: queryParameters,
    );

    return HttpResponseModel(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> delete<T>(String path) async {
    final response = await client.delete(path);

    return HttpResponseModel(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
