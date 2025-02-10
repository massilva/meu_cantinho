import 'package:flutter/material.dart';

class AppKeys {
  static const appTitle = Key('appTitle');
  static const places = Key('places');
  static const placesEmpty = Key('placesEmpty');
  static placeItem(String suffix) => Key('place_$suffix');
}
