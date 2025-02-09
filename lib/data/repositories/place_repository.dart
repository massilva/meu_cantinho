import '../../utils/types.dart';

abstract class PlaceRepository {
  Future<ResultPlaceList> fetchPlaces();
}
