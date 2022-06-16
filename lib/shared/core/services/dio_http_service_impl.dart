import 'package:dio/dio.dart';
import 'package:clean_arch_aula/shared/core/services/http_service.dart';

class DioHttpServiceImpl implements HttpService {
  late Dio _dio;

  DioHttpServiceImpl() {
    _dio = Dio(
      BaseOptions(
        headers: {
          "content-type": "application/json;charset=utf-8",
        },
      ),
    );
  }

  @override
  Future get<T>({required String path, Map<String, dynamic>? queryParams}) {
    return _dio.get<T>(path, queryParameters: queryParams);
  }
}
