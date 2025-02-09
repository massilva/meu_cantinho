// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_save_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceSaveModelImpl _$$PlaceSaveModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceSaveModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceSaveModelImplToJson(
        _$PlaceSaveModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'rating': instance.rating,
    };
