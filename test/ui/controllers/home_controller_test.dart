import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cantinho/utils/types.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meu_cantinho/ui/controllers/home_controller.dart';
import 'package:meu_cantinho/data/repositories/place_repository.dart';
import 'package:meu_cantinho/utils/result.dart';
import 'package:meu_cantinho/data/models/place_model.dart';

class MockPlaceRepository extends Mock implements PlaceRepository {}

void main() {
  late MockPlaceRepository mockPlaceRepository;
  late HomeController homeController;

  setUp(() {
    mockPlaceRepository = MockPlaceRepository();
    homeController = HomeController(placeRepository: mockPlaceRepository);
  });

  group('GetPlaces', () {
    test('Deve retornar lista vazia', () async {
      final PlaceList placeList = [];
      when(() => mockPlaceRepository.fetchPlaces())
          .thenAnswer((_) async => Result.ok(placeList));

      await homeController.getPlaces.execute();

      final result = homeController.places;
      expect(result, isEmpty);
      expect(result, equals(placeList));
    });

    test('Deve listar locais salvos', () async {
      final placeList = [
        PlaceModel(
          id: 1,
          name: 'Place 1',
          description: 'Description',
          rating: 4.5,
        ),
      ];
      when(() => mockPlaceRepository.fetchPlaces())
          .thenAnswer((_) async => Result.ok(placeList));

      await homeController.getPlaces.execute();
      expect(homeController.places, equals(placeList));
    });

    test('Deve retornar uma lsita vázia após o erro', () async {
      when(() => mockPlaceRepository.fetchPlaces())
          .thenAnswer((_) async => Result.error(Exception('error')));

      await homeController.getPlaces.execute();
      expect(homeController.places, isEmpty);
    });
  });
}
