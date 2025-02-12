import 'package:meu_cantinho/data/models/place_model.dart';
import 'package:meu_cantinho/utils/types.dart';

final _database = [
  PlaceModel(
    id: 1,
    name: 'Praia Azul',
    description: 'Ótima praia',
    rating: 5.0,
  ),
  PlaceModel(
    id: 2,
    name: 'Parque Verde',
    description: 'Muita natureza',
    rating: 4.5,
  ),
];

PlaceList get fakeStorage => _database;
