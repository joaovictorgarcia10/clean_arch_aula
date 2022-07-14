import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = "https://viacep.com.br/ws/";
    options.headers = {
      "content-type": "application/json;charset=utf-8",
    };

    interceptors.add(LogInterceptor());
  }
}
