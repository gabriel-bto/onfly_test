class HttpResponseModel {
  final dynamic data;
  final int? statusCode;

  HttpResponseModel({
    required this.data,
    this.statusCode,
  });
}
