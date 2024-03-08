import 'package:cakeke/config/api_config.dart';
import 'package:cakeke/data/repositories/token_repository.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient client = ApiClient();
  final tokenRepository = TokenRepository();

  final Dio _clientDio =
      Dio(BaseOptions(baseUrl: baseUrl, contentType: Headers.jsonContentType));

  get dio => _clientDio;

  ApiClient() {
    _clientDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenRepository.getAccessToken();
          if (token != null) {
            options.headers["Authorization"] = token;
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 403) {
            await refreshToken();
            return handler.resolve(await _clientDio.request(
                error.requestOptions.path,
                options: error.requestOptions as Options));
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String> refreshToken() async {
    final refreshToken = await tokenRepository.getRefreshToken();
    final response =
        await client.dio.post("/auth/refresh", data: {refreshToken});
    tokenRepository.saveAccessToken(
        '${response.data.grantType} ${response.data.accessToken}');
    tokenRepository.saveRefreshToken(response.data.refreshToken);

    return response.data.accessToken;
  }

  void setClientUpdateToken(String token) {
    _clientDio.options.headers["Authorization"] = token;
  }

  RequestOptions clientOptions(
    String method,
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    int? receiveTimeout,
  }) {
    Map<String, dynamic> _extra = extra ?? {};
    final Map<String, dynamic> _queryParameters = queryParameters ?? {};
    final Map<String, dynamic> _headers = headers ?? {};
    final Map<String, dynamic> _data = data ?? {};

    final options = Options(
            method: method,
            headers: _headers,
            extra: _extra,
            receiveTimeout: _clientDio.options.receiveTimeout)
        .compose(_clientDio.options, path,
            queryParameters: _queryParameters, data: _data)
        .copyWith(baseUrl: _clientDio.options.baseUrl);

    return setStreamType(options);
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
