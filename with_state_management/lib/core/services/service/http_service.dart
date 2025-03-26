import 'package:dio/dio.dart';

import 'http_api.dart';

///
/// [HttpService] implements a singleton pattern to create a single instance of [Dio] client.
///
class HttpService {

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 500000),
      receiveTimeout: const Duration(milliseconds: 500000),
    ),
  );

  Dio getDio() => _dio;

  static HttpService? _instance;

  static HttpService getInstance() {
    _instance ??= HttpService();
    return _instance!;
  }

  static String _getBaseUrl(String endpoint) {
    return HttpApi.baseUrl + endpoint;
  }

  Future<Response> get(String endpoint, Map<String, dynamic>? queryParams, {Options? options}) async {
    String urlEndpoint = _getBaseUrl(endpoint);
    Response response = await _dio.get(urlEndpoint, queryParameters: queryParams, options: options ?? Options(contentType: Headers.jsonContentType));
    return response;
  }

  Future<Response> post(String endpoint, dynamic postData, Map<String, dynamic>? queryParams, {Options? options}) async {
    String urlEndpoint = _getBaseUrl(endpoint);
    Response response = await _dio.post(urlEndpoint, data: postData, queryParameters: queryParams, options: options ?? Options(contentType: Headers.formUrlEncodedContentType));
    return response;
  }

}