import '../../core/exceptions/fetch_place_exception.dart';
import '../../utils/result.dart';
import '../../utils/types.dart';
import 'place_repository.dart';
import 'services/storage_service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final StorageService storageService;

  PlaceRepositoryImpl({required this.storageService});

  @override
  Future<ResultPlaceList> fetchPlaces() async {
    try {
      final response = await storageService.fetchPlaces();
      return Result.ok(response);
    } catch (_) {
      return ResultPlaceList.error(FetchPlaceException());
    }
  }
}
