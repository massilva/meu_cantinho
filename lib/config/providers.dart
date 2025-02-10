import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/place_repository.dart';
import '../data/repositories/place_repository_impl.dart';
import '../data/repositories/services/storage_service.dart';
import '../data/services/api_back4app_client_service.dart';
import '../ui/controllers/home_controller.dart';

class Providers {
  static List<SingleChildWidget> all({
    SingleChildWidget? dio,
    List<SingleChildWidget>? storageService,
  }) {
    return [
      ...[dio ?? _dio()],
      ...(storageService ?? _storageService()),
      ..._placeRepository(),
      ..._homeController(),
    ];
  }

  static SingleChildWidget _dio() {
    return Provider<Dio>(create: (_) => Dio());
  }

  static List<SingleChildWidget> _storageService() {
    return [
      Provider<StorageService>(create: (_) => ApiBack4AppClientService()),
    ];
  }

  static List<SingleChildWidget> _placeRepository() {
    return [
      Provider<PlaceRepository>(
        create: (context) => PlaceRepositoryImpl(
          storageService: context.read<StorageService>(),
        ),
      ),
    ];
  }

  static List<SingleChildWidget> _homeController() {
    return [
      ChangeNotifierProvider<HomeController>(
        create: (context) => HomeController(
          placeRepository: context.read<PlaceRepository>(),
        ),
      ),
    ];
  }
}
