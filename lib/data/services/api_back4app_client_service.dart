import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../utils/strings/exceptions_string.dart';
import '../../utils/types.dart';
import '../models/place_model.dart';
import '../models/place_save_model.dart';
import '../repositories/services/storage_service.dart';

class ApiBack4AppClientService implements StorageService {
  @override
  Future<PlaceList> fetchPlaces() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Place'));
    final response = await query.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((obj) => PlaceModel.fromJson(obj.toJson()))
          .toList();
    } else {
      throw Exception(
          ExceptionsString.fetchPlacesException(response.error!.message));
    }
  }

  Future<bool> savePlace(PlaceSaveModel place) async {
    final parseObject = ParseObject('Place')
      ..set('name', place.name)
      ..set('description', place.description)
      ..set('rating', place.rating);
    final result = await parseObject.save();

    if (result.error != null) {
      throw Exception(
          ExceptionsString.savePlaceException(result.error!.message));
    }

    return result.success;
  }
}
