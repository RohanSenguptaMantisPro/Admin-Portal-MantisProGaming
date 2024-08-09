// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_details.dart';

class GameDetailsMapper extends ClassMapperBase<GameDetails> {
  GameDetailsMapper._();

  static GameDetailsMapper? _instance;
  static GameDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetails';

  static String? _$id(GameDetails v) => v.id;
  static const Field<GameDetails, String> _f$id = Field('id', _$id, key: '_id');
  static String? _$packageName(GameDetails v) => v.packageName;
  static const Field<GameDetails, String> _f$packageName =
      Field('packageName', _$packageName);
  static int? _$timesAdded(GameDetails v) => v.timesAdded;
  static const Field<GameDetails, int> _f$timesAdded =
      Field('timesAdded', _$timesAdded);
  static int? _$timesPlayed(GameDetails v) => v.timesPlayed;
  static const Field<GameDetails, int> _f$timesPlayed =
      Field('timesPlayed', _$timesPlayed);
  static String? _$createdAt(GameDetails v) => v.createdAt;
  static const Field<GameDetails, String> _f$createdAt =
      Field('createdAt', _$createdAt);
  static String? _$updatedAt(GameDetails v) => v.updatedAt;
  static const Field<GameDetails, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static String? _$name(GameDetails v) => v.name;
  static const Field<GameDetails, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<GameDetails> fields = const {
    #id: _f$id,
    #packageName: _f$packageName,
    #timesAdded: _f$timesAdded,
    #timesPlayed: _f$timesPlayed,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #name: _f$name,
  };

  static GameDetails _instantiate(DecodingData data) {
    return GameDetails(
        id: data.dec(_f$id),
        packageName: data.dec(_f$packageName),
        timesAdded: data.dec(_f$timesAdded),
        timesPlayed: data.dec(_f$timesPlayed),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetails>(map);
  }

  static GameDetails fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetails>(json);
  }
}

mixin GameDetailsMappable {
  String toJson() {
    return GameDetailsMapper.ensureInitialized()
        .encodeJson<GameDetails>(this as GameDetails);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsMapper.ensureInitialized()
        .encodeMap<GameDetails>(this as GameDetails);
  }

  GameDetailsCopyWith<GameDetails, GameDetails, GameDetails> get copyWith =>
      _GameDetailsCopyWithImpl(this as GameDetails, $identity, $identity);
  @override
  String toString() {
    return GameDetailsMapper.ensureInitialized()
        .stringifyValue(this as GameDetails);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsMapper.ensureInitialized()
        .equalsValue(this as GameDetails, other);
  }

  @override
  int get hashCode {
    return GameDetailsMapper.ensureInitialized().hashValue(this as GameDetails);
  }
}

extension GameDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetails, $Out> {
  GameDetailsCopyWith<$R, GameDetails, $Out> get $asGameDetails =>
      $base.as((v, t, t2) => _GameDetailsCopyWithImpl(v, t, t2));
}

abstract class GameDetailsCopyWith<$R, $In extends GameDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? packageName,
      int? timesAdded,
      int? timesPlayed,
      String? createdAt,
      String? updatedAt,
      String? name});
  GameDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetails, $Out>
    implements GameDetailsCopyWith<$R, GameDetails, $Out> {
  _GameDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetails> $mapper =
      GameDetailsMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? packageName = $none,
          Object? timesAdded = $none,
          Object? timesPlayed = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? name = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (packageName != $none) #packageName: packageName,
        if (timesAdded != $none) #timesAdded: timesAdded,
        if (timesPlayed != $none) #timesPlayed: timesPlayed,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (name != $none) #name: name
      }));
  @override
  GameDetails $make(CopyWithData data) => GameDetails(
      id: data.get(#id, or: $value.id),
      packageName: data.get(#packageName, or: $value.packageName),
      timesAdded: data.get(#timesAdded, or: $value.timesAdded),
      timesPlayed: data.get(#timesPlayed, or: $value.timesPlayed),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      name: data.get(#name, or: $value.name));

  @override
  GameDetailsCopyWith<$R2, GameDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDetailsCopyWithImpl($value, $cast, t);
}
