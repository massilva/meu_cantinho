import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/data/models/place_model.dart';
import 'package:meu_cantinho/data/models/place_save_model.dart';
import 'package:meu_cantinho/data/services/api_back4app_client_service.dart';
import 'package:meu_cantinho/utils/types.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fake_storage.dart';

class MockApiBack4AppClientService extends Mock
    implements ApiBack4AppClientService {}

void main() {
  late MockApiBack4AppClientService storageService;

  setUp(() {
    storageService = MockApiBack4AppClientService();
  });

  group('ApiBack4AppClientService :: fetchPlaces', () {
    test('Deve retornar uma lista de PlaceModel vázia', () async {
      when(() => storageService.fetchPlaces()).thenAnswer((_) async => []);

      final places = await storageService.fetchPlaces();
      expect(places, isA<PlaceList>());
      expect(places, isEmpty);
    });

    test('Deve retornar uma lista com dados quando houver registros', () async {
      final firstPlace = fakeStorage.first;

      when(() => storageService.fetchPlaces())
          .thenAnswer((_) async => fakeStorage);

      final places = await storageService.fetchPlaces();
      expect(places, isA<PlaceList>());
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
      final place = PlaceSaveModel(
        name: 'Praia Azul',
        description: 'Ótima praia',
        rating: 4.5,
      );

      when(() => storageService.savePlace(place)).thenAnswer((_) async {
        fakeStorage.add(
          PlaceModel(
            id: 1,
            name: place.name,
            description: place.description,
            rating: place.rating,
          ),
        );
        return true;
      });

      final savedPlace = await storageService.savePlace(place);
      expect(savedPlace, isA<bool>());
      expect(savedPlace, true);

      when(() => storageService.fetchPlaces())
          .thenAnswer((_) async => fakeStorage);

      final places = await storageService.fetchPlaces();
      expect(places, isA<PlaceList>());
      expect(places.length, fakeStorage.length);
      expect(places.first, fakeStorage.first);
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
