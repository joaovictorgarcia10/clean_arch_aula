abstract class HttpService {
  Future<dynamic> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
  });
}
