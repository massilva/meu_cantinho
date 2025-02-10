import 'package:flutter/material.dart';

import '../utils/constants/keys.dart';
import '../utils/strings/app_string.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({required this.controller, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.getPlaces.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.appTitle,
          key: AppKeys.appTitle,
        ),
      ),
      body: ListenableBuilder(
        listenable: Listenable.merge([controller.getPlaces]),
        builder: (context, child) {
          if (controller.places.isEmpty) {
            return Center(
              key: AppKeys.placesEmpty,
              child: Text(AppString.emptyPlaces),
            );
          }

          return ListView.builder(
            key: AppKeys.places,
            itemCount: controller.places.length,
            itemBuilder: (context, index) {
              final place = controller.places[index];
              return ListTile(
                key: AppKeys.placeItem('${place.id}'),
                title: Text(place.name),
                subtitle: Text(place.description),
                trailing: Text(place.rating.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
