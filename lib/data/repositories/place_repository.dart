import '../../utils/result.dart';
import '../models/place_model.dart';

abstract class PlaceRepository {
  Future<Result<List<PlaceModel>>> fetchPlaces();
}
