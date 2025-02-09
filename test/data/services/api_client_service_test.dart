import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/data/models/place_model.dart';
import 'package:meu_cantinho/data/services/api_back4app_client_service.dart';
import 'package:mocktail/mocktail.dart';

class MockApiBack4AppClientService extends Mock
    implements ApiBack4AppClientService {}

void main() {
  late MockApiBack4AppClientService storageService;

  setUp(() {
    storageService = MockApiBack4AppClientService();
  });

  group('ApiBack4AppClientService', () {
    test('fetchPlaces deve retornar uma lista de PlaceModel vázia', () async {
      when(() => storageService.fetchPlaces()).thenAnswer((_) async => []);

      final places = await storageService.fetchPlaces();
      expect(places, isA<List<PlaceModel>>());
      expect(places, isEmpty);
    });

    test('Deve retornar uma lista com dados quando houver registros', () async {
      final firstPlace = PlaceModel(
        id: '1',
        name: 'Praia Azul',
        description: 'Ótima praia',
        rating: 4.5,
      );
      final mockPlaces = [
        firstPlace,
        PlaceModel(
          id: '2',
          name: 'Parque Verde',
          description: 'Ótimo para caminhar',
          rating: 5,
        ),
      ];

      when(() => storageService.fetchPlaces())
          .thenAnswer((_) async => mockPlaces);

      final places = await storageService.fetchPlaces();
      expect(places, isA<List<PlaceModel>>());
      expect(places.length, 2);
      expect(places.first, firstPlace);
    });

    test('Deve lançar uma exceção quando a API falha', () async {
      when(() => storageService.fetchPlaces())
          .thenThrow(Exception('Erro na API'));

      expect(() async => await storageService.fetchPlaces(), throwsException);
    });
  });
}
