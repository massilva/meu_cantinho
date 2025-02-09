import '../../../utils/types.dart';

abstract class StorageService {
  Future<PlaceList> fetchPlaces();
}
