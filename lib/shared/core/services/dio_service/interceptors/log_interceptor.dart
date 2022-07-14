// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class LogInterceptor implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST [${options.method}] => PATH: ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.path}');
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    handler.resolve(Response(requestOptions: err.requestOptions));
  }
}
