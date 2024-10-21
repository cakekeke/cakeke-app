import 'package:cakeke/config/api_config.dart';
import 'package:cakeke/data/models/auth/refresh_token_reponse.dart';
import 'package:cakeke/data/repositories/auth_repository.dart';
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
          // 토큰 갱신 시도 여부를 추적하는 플래그
          var retry = error.requestOptions.extra["retry"] ?? false;

          if (error.response?.statusCode == 403 && !retry) {
            final refreshToken = await fetchRefreshToken();
            if (refreshToken != null) {
              // 재시도를 위한 옵션 설정 (retry 플래그 추가)
              final options = error.requestOptions;
              options.extra["retry"] = true; // 한 번만 재시도하게 설정
              options.headers["Authorization"] =
                  "Bearer $refreshToken"; // 새로운 토큰 설정
              return handler.resolve(await _clientDio.request(options.path,
                  options: options as Options));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> fetchRefreshToken() async {
    try {
      final refreshToken = await tokenRepository.getRefreshToken();
      if (refreshToken == null) {
        final authRepository = AuthRepository();
        await authRepository.signout();
        return null;
      }
      final response = await client.dio
          .fetch(client.clientOptions('POST', '/auth/refresh', data: {
        "refreshToken": refreshToken,
      }));

      final refreshTokenInfo = RefreshTokenResponse.fromJson(response.data);
      await tokenRepository.saveAccessToken(
          '${refreshTokenInfo.grantType} ${refreshTokenInfo.accessToken}');
      await tokenRepository.saveRefreshToken(refreshTokenInfo.refreshToken);

      return response.data.accessToken;
    } catch (e) {
      final authRepository = AuthRepository();
      await authRepository.signout();
      return null;
    }
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
