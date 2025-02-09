import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_save_model.freezed.dart';
part 'place_save_model.g.dart';

@freezed
class PlaceSaveModel with _$PlaceSaveModel {
  const factory PlaceSaveModel({
    required String name,
    required String description,
    required double rating,
  }) = _PlaceSaveModel;

  factory PlaceSaveModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceSaveModelFromJson(json);
}
