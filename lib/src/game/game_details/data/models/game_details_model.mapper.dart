// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_details_model.dart';

class GameDetailsModelMapper extends SubClassMapperBase<GameDetailsModel> {
  GameDetailsModelMapper._();

  static GameDetailsModelMapper? _instance;
  static GameDetailsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsModelMapper._());
      GameDetailsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsModel';

  static String? _$id(GameDetailsModel v) => v.id;
  static const Field<GameDetailsModel, String> _f$id =
      Field('id', _$id, key: '_id');
  static String? _$name(GameDetailsModel v) => v.name;
  static const Field<GameDetailsModel, String> _f$name = Field('name', _$name);
  static String? _$packageName(GameDetailsModel v) => v.packageName;
  static const Field<GameDetailsModel, String> _f$packageName =
      Field('packageName', _$packageName);
  static int? _$timesAdded(GameDetailsModel v) => v.timesAdded;
  static const Field<GameDetailsModel, int> _f$timesAdded =
      Field('timesAdded', _$timesAdded);
  static int? _$timesPlayed(GameDetailsModel v) => v.timesPlayed;
  static const Field<GameDetailsModel, int> _f$timesPlayed =
      Field('timesPlayed', _$timesPlayed);
  static String? _$createdAt(GameDetailsModel v) => v.createdAt;
  static const Field<GameDetailsModel, String> _f$createdAt =
      Field('createdAt', _$createdAt);
  static String? _$updatedAt(GameDetailsModel v) => v.updatedAt;
  static const Field<GameDetailsModel, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt);

  @override
  final MappableFields<GameDetailsModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #packageName: _f$packageName,
    #timesAdded: _f$timesAdded,
    #timesPlayed: _f$timesPlayed,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'gameDetailsModel';
  @override
  late final ClassMapperBase superMapper =
      GameDetailsMapper.ensureInitialized();

  static GameDetailsModel _instantiate(DecodingData data) {
    return GameDetailsModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        packageName: data.dec(_f$packageName),
        timesAdded: data.dec(_f$timesAdded),
        timesPlayed: data.dec(_f$timesPlayed),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsModel>(map);
  }

  static GameDetailsModel fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsModel>(json);
  }
}

mixin GameDetailsModelMappable {
  String toJson() {
    return GameDetailsModelMapper.ensureInitialized()
        .encodeJson<GameDetailsModel>(this as GameDetailsModel);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsModelMapper.ensureInitialized()
        .encodeMap<GameDetailsModel>(this as GameDetailsModel);
  }

  GameDetailsModelCopyWith<GameDetailsModel, GameDetailsModel, GameDetailsModel>
      get copyWith => _GameDetailsModelCopyWithImpl(
          this as GameDetailsModel, $identity, $identity);
  @override
  String toString() {
    return GameDetailsModelMapper.ensureInitialized()
        .stringifyValue(this as GameDetailsModel);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsModelMapper.ensureInitialized()
        .equalsValue(this as GameDetailsModel, other);
  }

  @override
  int get hashCode {
    return GameDetailsModelMapper.ensureInitialized()
        .hashValue(this as GameDetailsModel);
  }
}

extension GameDetailsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetailsModel, $Out> {
  GameDetailsModelCopyWith<$R, GameDetailsModel, $Out>
      get $asGameDetailsModel =>
          $base.as((v, t, t2) => _GameDetailsModelCopyWithImpl(v, t, t2));
}

abstract class GameDetailsModelCopyWith<$R, $In extends GameDetailsModel, $Out>
    implements GameDetailsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? name,
      String? packageName,
      int? timesAdded,
      int? timesPlayed,
      String? createdAt,
      String? updatedAt});
  GameDetailsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameDetailsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetailsModel, $Out>
    implements GameDetailsModelCopyWith<$R, GameDetailsModel, $Out> {
  _GameDetailsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetailsModel> $mapper =
      GameDetailsModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? name = $none,
          Object? packageName = $none,
          Object? timesAdded = $none,
          Object? timesPlayed = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (packageName != $none) #packageName: packageName,
        if (timesAdded != $none) #timesAdded: timesAdded,
        if (timesPlayed != $none) #timesPlayed: timesPlayed,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  GameDetailsModel $make(CopyWithData data) => GameDetailsModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      packageName: data.get(#packageName, or: $value.packageName),
      timesAdded: data.get(#timesAdded, or: $value.timesAdded),
      timesPlayed: data.get(#timesPlayed, or: $value.timesPlayed),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  GameDetailsModelCopyWith<$R2, GameDetailsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDetailsModelCopyWithImpl($value, $cast, t);
}
