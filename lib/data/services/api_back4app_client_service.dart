import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../models/place_model.dart';
import '../repositories/services/storage_service.dart';

class ApiBack4AppClientService implements StorageService {
  @override
  Future<List<PlaceModel>> fetchPlaces() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Place'));
    final response = await query.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((obj) => PlaceModel.fromJson(obj.toJson()))
          .toList();
    } else {
      throw Exception('Erro ao buscar locais: ${response.error?.message}');
    }
  }
}
