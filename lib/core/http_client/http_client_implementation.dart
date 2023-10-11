import '../utils/api_utils.dart';
import 'http_client.dart';
import 'package:http/http.dart' as http;

import 'http_response_model.dart';

class HttpClientImplementation implements HttpClient {
  final client = http.Client();

  @override
  Future<HttpResponseModel> get<T>(String path) async {
    final response = await client.get(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );

    return HttpResponseModel(
      data: response.body,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.post(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );

    return HttpResponseModel(
      data: response.body,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.patch(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    
    return HttpResponseModel(
      data: response.body,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponseModel> delete<T>(String path) async {
    final response = await client.delete(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    
    return HttpResponseModel(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
