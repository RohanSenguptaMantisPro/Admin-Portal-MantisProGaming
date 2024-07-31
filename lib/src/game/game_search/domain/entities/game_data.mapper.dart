// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_data.dart';

class GameDataMapper extends ClassMapperBase<GameData> {
  GameDataMapper._();

  static GameDataMapper? _instance;
  static GameDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GameData';

  static String? _$id(GameData v) => v.id;
  static const Field<GameData, String> _f$id = Field('id', _$id, key: '_id');
  static String? _$name(GameData v) => v.name;
  static const Field<GameData, String> _f$name = Field('name', _$name);
  static String? _$packageName(GameData v) => v.packageName;
  static const Field<GameData, String> _f$packageName =
      Field('packageName', _$packageName);
  static int? _$timesAdded(GameData v) => v.timesAdded;
  static const Field<GameData, int> _f$timesAdded =
      Field('timesAdded', _$timesAdded);
  static int? _$timesPlayed(GameData v) => v.timesPlayed;
  static const Field<GameData, int> _f$timesPlayed =
      Field('timesPlayed', _$timesPlayed);
  static String? _$createdAt(GameData v) => v.createdAt;
  static const Field<GameData, String> _f$createdAt =
      Field('createdAt', _$createdAt);
  static String? _$updatedAt(GameData v) => v.updatedAt;
  static const Field<GameData, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt);

  @override
  final MappableFields<GameData> fields = const {
    #id: _f$id,
    #name: _f$name,
    #packageName: _f$packageName,
    #timesAdded: _f$timesAdded,
    #timesPlayed: _f$timesPlayed,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static GameData _instantiate(DecodingData data) {
    return GameData(
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

  static GameData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameData>(map);
  }

  static GameData fromJson(String json) {
    return ensureInitialized().decodeJson<GameData>(json);
  }
}

mixin GameDataMappable {
  String toJson() {
    return GameDataMapper.ensureInitialized()
        .encodeJson<GameData>(this as GameData);
  }

  Map<String, dynamic> toMap() {
    return GameDataMapper.ensureInitialized()
        .encodeMap<GameData>(this as GameData);
  }

  GameDataCopyWith<GameData, GameData, GameData> get copyWith =>
      _GameDataCopyWithImpl(this as GameData, $identity, $identity);
  @override
  String toString() {
    return GameDataMapper.ensureInitialized().stringifyValue(this as GameData);
  }

  @override
  bool operator ==(Object other) {
    return GameDataMapper.ensureInitialized()
        .equalsValue(this as GameData, other);
  }

  @override
  int get hashCode {
    return GameDataMapper.ensureInitialized().hashValue(this as GameData);
  }
}

extension GameDataValueCopy<$R, $Out> on ObjectCopyWith<$R, GameData, $Out> {
  GameDataCopyWith<$R, GameData, $Out> get $asGameData =>
      $base.as((v, t, t2) => _GameDataCopyWithImpl(v, t, t2));
}

abstract class GameDataCopyWith<$R, $In extends GameData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? name,
      String? packageName,
      int? timesAdded,
      int? timesPlayed,
      String? createdAt,
      String? updatedAt});
  GameDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameData, $Out>
    implements GameDataCopyWith<$R, GameData, $Out> {
  _GameDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameData> $mapper =
      GameDataMapper.ensureInitialized();
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
  GameData $make(CopyWithData data) => GameData(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      packageName: data.get(#packageName, or: $value.packageName),
      timesAdded: data.get(#timesAdded, or: $value.timesAdded),
      timesPlayed: data.get(#timesPlayed, or: $value.timesPlayed),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  GameDataCopyWith<$R2, GameData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDataCopyWithImpl($value, $cast, t);
}
