import '../../models/place_model.dart';

abstract class StorageService {
  Future<List<PlaceModel>> fetchPlaces();
}
