import 'package:flutter/foundation.dart';

import '../../data/repositories/place_repository.dart';
import '../../utils/commands.dart';
import '../../utils/result.dart';
import '../../utils/types.dart';

class HomeController extends ChangeNotifier {
  final PlaceRepository _placeRepository;
  final PlaceList _places = [];
  late final Command0<PlaceList> getPlaces;

  HomeController({required PlaceRepository placeRepository})
      : _placeRepository = placeRepository {
    getPlaces = Command0(_getPlaces);
  }

  PlaceList get places => _places;

  Future<ResultPlaceList> _getPlaces() async {
    var result = await _placeRepository.fetchPlaces();

    switch (result) {
      case Ok<PlaceList>():
        _places.addAll(result.value);
      case Error<PlaceList>():
        _places.clear();
    }

    notifyListeners();
    return result;
  }
}
