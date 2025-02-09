import '../../core/exceptions/fetch_place_exception.dart';
import '../../utils/result.dart';
import '../models/place_model.dart';
import 'place_repository.dart';
import 'services/storage_service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final StorageService storageService;

  PlaceRepositoryImpl({required this.storageService});

  @override
  Future<Result<List<PlaceModel>>> fetchPlaces() async {
    try {
      final response = await storageService.fetchPlaces();
      return Result.ok(response);
    } catch (_) {
      return Result<List<PlaceModel>>.error(FetchPlaceException());
    }
  }
}
