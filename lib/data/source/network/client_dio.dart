import 'package:cakeke/config/api_config.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient client = ApiClient();

  final Dio _clientDio =
  Dio(BaseOptions(baseUrl: baseUrl));

  get dio => _clientDio;

  void setClientRefreshToken(String token) {
    _clientDio.options.headers["Authorization"] = token;
  }

  RequestOptions settingOptions(String method, String path,
      {Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? data,
        int? receiveTimeout}) {
    Map<String, dynamic> _extra = extra ?? {};
    final Map<String, dynamic> _queryParameters = queryParameters ?? {};
    final Map<String, dynamic> _headers = headers ?? {};
    final Map<String, dynamic> _data = data ?? {};

    return Options(
        method: method,
        headers: _headers,
        extra: _extra,
        receiveTimeout: _clientDio.options.receiveTimeout)
        .compose(_clientDio.options, path,
        queryParameters: _queryParameters, data: _data)
        .copyWith(baseUrl: _clientDio.options.baseUrl);
  }

  RequestOptions setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

}