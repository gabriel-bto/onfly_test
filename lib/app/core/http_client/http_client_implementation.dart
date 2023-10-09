import 'package:http/http.dart';

import '../utils/api_utils.dart';
import 'http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImplementation implements HttpClient {
  final client = http.Client();

  @override
  Future<Response> get<T>(String path) async {
    final response = await client.get(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    return response;
  }

  @override
  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.post(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    return response;
  }

  @override
  Future<Response> patch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.patch(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    return response;
  }

  @override
  Future<Response> delete<T>(String path) async {
    final response = await client.delete(
      Uri.parse(path),
      headers: ApiUtils.headers,
    );
    return response;
  }
}
