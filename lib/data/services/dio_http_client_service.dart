import 'package:dio/dio.dart';

import '../../../utils/result.dart';
import '../repositories/services/http_client_service.dart';

class DioHttpClientService implements HttpClientService {
  final Dio dio;

  DioHttpClientService(this.dio);

  Future<Result<T>> _handleRequest<T>(
      Future<Response<T>> Function() request) async {
    try {
      final response = await request();
      return Result.ok(response.data as T);
    } on DioException catch (e) {
      return Result.error(Exception(e.message));
    } catch (e) {
      return Result.error(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _handleRequest(
        () => dio.get<T>(path, queryParameters: queryParameters));
  }

  @override
  Future<Result<T>> post<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _handleRequest(
        () => dio.post<T>(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future<Result<T>> put<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _handleRequest(
        () => dio.put<T>(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future<Result<T>> patch<T>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _handleRequest(
        () => dio.patch<T>(path, data: data, queryParameters: queryParameters));
  }

  @override
  Future<Result<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _handleRequest(
        () => dio.delete<T>(path, queryParameters: queryParameters));
  }
}
