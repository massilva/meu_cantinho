import '../../../utils/result.dart';

abstract class HttpClientService {
  Future<Result<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});
  Future<Result<T>> post<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Result<T>> put<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Result<T>> patch<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Result<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters});
}
