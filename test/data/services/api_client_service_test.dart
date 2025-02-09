import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/data/models/place_model.dart';
import 'package:meu_cantinho/data/models/place_save_model.dart';
import 'package:meu_cantinho/data/services/api_back4app_client_service.dart';
import 'package:mocktail/mocktail.dart';

class MockApiBack4AppClientService extends Mock
    implements ApiBack4AppClientService {}

void main() {
  late MockApiBack4AppClientService storageService;

  setUp(() {
    storageService = MockApiBack4AppClientService();
  });

  group('ApiBack4AppClientService :: fetchPlaces', () {
    test('fetchPlaces deve retornar uma lista de PlaceModel vázia', () async {
      when(() => storageService.fetchPlaces()).thenAnswer((_) async => []);

      final places = await storageService.fetchPlaces();
      expect(places, isA<List<PlaceModel>>());
      expect(places, isEmpty);
    });

    test('Deve retornar uma lista com dados quando houver registros', () async {
      final firstPlace = PlaceModel(
        id: 1,
        name: 'Praia Azul',
        description: 'Ótima praia',
        rating: 4.5,
      );
      final mockPlaces = [
        firstPlace,
        PlaceModel(
          id: 2,
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

  group('ApiBack4AppClientService :: savePlace', () {
    test('Deve retornar um PlaceModel', () async {
      final mockPlaces = <PlaceModel>[];
      final place = PlaceSaveModel(
        name: 'Praia Azul',
        description: 'Ótima praia',
        rating: 4.5,
      );

      when(() => storageService.savePlace(place)).thenAnswer((_) async {
        final mockPlace = PlaceModel(
          id: 1,
          name: place.name,
          description: place.description,
          rating: place.rating,
        );
        mockPlaces.add(mockPlace);
        return true;
      });

      final savedPlace = await storageService.savePlace(place);
      expect(savedPlace, isA<bool>());
      expect(savedPlace, true);

      when(() => storageService.fetchPlaces())
          .thenAnswer((_) async => mockPlaces);

      final places = await storageService.fetchPlaces();
      expect(places, isA<List<PlaceModel>>());
      expect(places.length, 1);
      expect(places.first, mockPlaces.first);
    });

    test('Deve lançar uma exceção quando a API falhar', () async {
      final place = PlaceSaveModel(
        name: 'Praia Azul',
        description: 'Ótima praia',
        rating: 5.0,
      );

      when(() => storageService.savePlace(place))
          .thenThrow(Exception('Erro na API'));

      expect(
          () async => await storageService.savePlace(place), throwsException);
    });
  });
}
