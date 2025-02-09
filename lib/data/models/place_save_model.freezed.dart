// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_save_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceSaveModel _$PlaceSaveModelFromJson(Map<String, dynamic> json) {
  return _PlaceSaveModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceSaveModel {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Serializes this PlaceSaveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceSaveModelCopyWith<PlaceSaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSaveModelCopyWith<$Res> {
  factory $PlaceSaveModelCopyWith(
          PlaceSaveModel value, $Res Function(PlaceSaveModel) then) =
      _$PlaceSaveModelCopyWithImpl<$Res, PlaceSaveModel>;
  @useResult
  $Res call({String name, String description, double rating});
}

/// @nodoc
class _$PlaceSaveModelCopyWithImpl<$Res, $Val extends PlaceSaveModel>
    implements $PlaceSaveModelCopyWith<$Res> {
  _$PlaceSaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceSaveModelImplCopyWith<$Res>
    implements $PlaceSaveModelCopyWith<$Res> {
  factory _$$PlaceSaveModelImplCopyWith(_$PlaceSaveModelImpl value,
          $Res Function(_$PlaceSaveModelImpl) then) =
      __$$PlaceSaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, double rating});
}

/// @nodoc
class __$$PlaceSaveModelImplCopyWithImpl<$Res>
    extends _$PlaceSaveModelCopyWithImpl<$Res, _$PlaceSaveModelImpl>
    implements _$$PlaceSaveModelImplCopyWith<$Res> {
  __$$PlaceSaveModelImplCopyWithImpl(
      _$PlaceSaveModelImpl _value, $Res Function(_$PlaceSaveModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? rating = null,
  }) {
    return _then(_$PlaceSaveModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceSaveModelImpl implements _PlaceSaveModel {
  const _$PlaceSaveModelImpl(
      {required this.name, required this.description, required this.rating});

  factory _$PlaceSaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceSaveModelImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final double rating;

  @override
  String toString() {
    return 'PlaceSaveModel(name: $name, description: $description, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceSaveModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, rating);

  /// Create a copy of PlaceSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceSaveModelImplCopyWith<_$PlaceSaveModelImpl> get copyWith =>
      __$$PlaceSaveModelImplCopyWithImpl<_$PlaceSaveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceSaveModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceSaveModel implements PlaceSaveModel {
  const factory _PlaceSaveModel(
      {required final String name,
      required final String description,
      required final double rating}) = _$PlaceSaveModelImpl;

  factory _PlaceSaveModel.fromJson(Map<String, dynamic> json) =
      _$PlaceSaveModelImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  double get rating;

  /// Create a copy of PlaceSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceSaveModelImplCopyWith<_$PlaceSaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
