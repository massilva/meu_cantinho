import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meu_cantinho/data/services/dio_http_client_service.dart';
import 'package:meu_cantinho/data/repositories/services/http_client_service.dart';
import 'package:meu_cantinho/utils/result.dart';

class MockDio extends Mock implements Dio {}

class MockResponse<T> extends Mock implements Response<T> {}

void main() {
  late Dio mockDio;
  late HttpClientService httpClient;

  setUp(() {
    mockDio = MockDio();
    httpClient = DioHttpClientService(mockDio);
  });

  group('DioHttpClientService', () {
    const String testUrl = 'https://api.example.com/resource';

    test('deve retornar Result.ok ao chamar GET com sucesso', () async {
      final mockResponse = MockResponse<Map<String, dynamic>>();
      when(() => mockResponse.data).thenReturn({'key': 'value'});
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockDio.get<Map<String, dynamic>>(testUrl))
          .thenAnswer((_) async => mockResponse);

      final result = await httpClient.get<Map<String, dynamic>>(testUrl);
      expect(result, isA<Ok<Map<String, dynamic>>>());
      expect((result as Ok).value, {'key': 'value'});
    });

    test('deve retornar Result.error ao chamar GET e receber erro 404',
        () async {
      when(() => mockDio.get<Map<String, dynamic>>(testUrl)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: testUrl),
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: testUrl),
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await httpClient.get<Map<String, dynamic>>(testUrl);
      expect(result, isA<Error>());
      expect((result as Error).error, isA<Exception>());
    });

    test('deve retornar Result.ok ao chamar POST com sucesso', () async {
      final mockResponse = MockResponse<Map<String, dynamic>>();
      when(() => mockResponse.data).thenReturn({'created': true});
      when(() => mockResponse.statusCode).thenReturn(201);
      when(() => mockDio.post<Map<String, dynamic>>(testUrl,
          data: any(named: 'data'))).thenAnswer((_) async => mockResponse);

      final result = await httpClient
          .post<Map<String, dynamic>>(testUrl, data: {'name': 'test'});

      expect(result, isA<Ok<Map<String, dynamic>>>());
      expect((result as Ok).value, {'created': true});
    });

    test('deve retornar Result.error ao chamar POST e falhar', () async {
      when(() => mockDio.post<Map<String, dynamic>>(testUrl,
              data: any(named: 'data')))
          .thenThrow(DioException(
              requestOptions: RequestOptions(path: testUrl),
              type: DioExceptionType.connectionTimeout));

      final result = await httpClient
          .post<Map<String, dynamic>>(testUrl, data: {'name': 'test'});

      expect(result, isA<Error>());
      expect((result as Error).error, isA<Exception>());
    });

    test('deve retornar Result.ok ao chamar DELETE com sucesso', () async {
      final mockResponse = MockResponse<void>();
      when(() => mockResponse.statusCode).thenReturn(204);
      when(() => mockDio.delete<void>(testUrl))
          .thenAnswer((_) async => mockResponse);

      final result = await httpClient.delete<void>(testUrl);

      expect(result, isA<Ok<void>>());
    });

    test('deve retornar Result.error ao chamar DELETE e falhar', () async {
      when(() => mockDio.delete<void>(testUrl)).thenThrow(DioException(
          requestOptions: RequestOptions(path: testUrl),
          type: DioExceptionType.unknown));

      final result = await httpClient.delete<void>(testUrl);

      expect(result, isA<Error>());
      expect((result as Error).error, isA<Exception>());
    });
  });
}
