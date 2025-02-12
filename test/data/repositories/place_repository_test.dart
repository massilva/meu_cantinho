import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/core/exceptions/fetch_place_exception.dart';
import 'package:meu_cantinho/data/repositories/place_repository.dart';
import 'package:meu_cantinho/data/repositories/place_repository_impl.dart';
import 'package:meu_cantinho/data/repositories/services/storage_service.dart';
import 'package:meu_cantinho/utils/result.dart';
import 'package:meu_cantinho/utils/types.dart';
import 'package:mocktail/mocktail.dart';

import '../../../testing/fake_storage.dart';

class MockStorageService extends Mock implements StorageService {}

void main() {
  late PlaceRepository placeRepository;
  late StorageService storageService;

  setUp(() {
    storageService = MockStorageService();
    placeRepository = PlaceRepositoryImpl(
      storageService: storageService,
    );
  });

  group('PlaceRepository :: fetchPlaces', () {
    test('Deve retornar o Result.Ok com uma lista de PlaceModel vázia',
        () async {
      when(() => storageService.fetchPlaces()).thenAnswer((_) async => []);

      final places = await placeRepository.fetchPlaces();
      expect(places, isA<Ok<PlaceList>>());
      expect((places as Ok).value, isEmpty);
    });

    test(
        'Deve retornar o Result.Ok com a lista com dados quando houver registro',
        () async {
      when(() => storageService.fetchPlaces())
          .thenAnswer((_) async => fakeStorage);

      final places = await placeRepository.fetchPlaces();
      expect(places, isA<Ok<PlaceList>>());
      final placeOk = places as Ok<PlaceList>;
      expect(placeOk.value, isNotEmpty);
      expect(placeOk.value.length, 2);
      final firstPlace = placeOk.value.first;
      expect(firstPlace.id, 1);
      expect(firstPlace.name, 'Praia Azul');
      expect(firstPlace.description, 'Ótima praia');
      expect(firstPlace.rating, 5.0);
    });

    test('Deve lançar uma exceção quando a API falha', () async {
      when(() => storageService.fetchPlaces())
          .thenThrow(Exception('Fora do ar'));

      final places = await placeRepository.fetchPlaces();
      expect(places, isA<Error<PlaceList>>());
      final placeError = places as Error<PlaceList>;
      expect(placeError.error, isA<FetchPlaceException>());
    });
  });
}
