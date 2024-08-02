// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_details_image_model.dart';

class GameDetailsImageModelMapper
    extends SubClassMapperBase<GameDetailsImageModel> {
  GameDetailsImageModelMapper._();

  static GameDetailsImageModelMapper? _instance;
  static GameDetailsImageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsImageModelMapper._());
      GameDetailsImageMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsImageModel';

  static Uint8List? _$imageData(GameDetailsImageModel v) => v.imageData;
  static const Field<GameDetailsImageModel, Uint8List> _f$imageData =
      Field('imageData', _$imageData, opt: true);
  static String? _$imageType(GameDetailsImageModel v) => v.imageType;
  static const Field<GameDetailsImageModel, String> _f$imageType =
      Field('imageType', _$imageType, opt: true);

  @override
  final MappableFields<GameDetailsImageModel> fields = const {
    #imageData: _f$imageData,
    #imageType: _f$imageType,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'gameDetailsImageModel';
  @override
  late final ClassMapperBase superMapper =
      GameDetailsImageMapper.ensureInitialized();

  static GameDetailsImageModel _instantiate(DecodingData data) {
    return GameDetailsImageModel(
        imageData: data.dec(_f$imageData), imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsImageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsImageModel>(map);
  }

  static GameDetailsImageModel fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsImageModel>(json);
  }
}

mixin GameDetailsImageModelMappable {
  String toJson() {
    return GameDetailsImageModelMapper.ensureInitialized()
        .encodeJson<GameDetailsImageModel>(this as GameDetailsImageModel);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsImageModelMapper.ensureInitialized()
        .encodeMap<GameDetailsImageModel>(this as GameDetailsImageModel);
  }

  GameDetailsImageModelCopyWith<GameDetailsImageModel, GameDetailsImageModel,
          GameDetailsImageModel>
      get copyWith => _GameDetailsImageModelCopyWithImpl(
          this as GameDetailsImageModel, $identity, $identity);
  @override
  String toString() {
    return GameDetailsImageModelMapper.ensureInitialized()
        .stringifyValue(this as GameDetailsImageModel);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsImageModelMapper.ensureInitialized()
        .equalsValue(this as GameDetailsImageModel, other);
  }

  @override
  int get hashCode {
    return GameDetailsImageModelMapper.ensureInitialized()
        .hashValue(this as GameDetailsImageModel);
  }
}

extension GameDetailsImageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetailsImageModel, $Out> {
  GameDetailsImageModelCopyWith<$R, GameDetailsImageModel, $Out>
      get $asGameDetailsImageModel =>
          $base.as((v, t, t2) => _GameDetailsImageModelCopyWithImpl(v, t, t2));
}

abstract class GameDetailsImageModelCopyWith<
    $R,
    $In extends GameDetailsImageModel,
    $Out> implements GameDetailsImageCopyWith<$R, $In, $Out> {
  @override
  $R call({Uint8List? imageData, String? imageType});
  GameDetailsImageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameDetailsImageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetailsImageModel, $Out>
    implements GameDetailsImageModelCopyWith<$R, GameDetailsImageModel, $Out> {
  _GameDetailsImageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetailsImageModel> $mapper =
      GameDetailsImageModelMapper.ensureInitialized();
  @override
  $R call({Object? imageData = $none, Object? imageType = $none}) =>
      $apply(FieldCopyWithData({
        if (imageData != $none) #imageData: imageData,
        if (imageType != $none) #imageType: imageType
      }));
  @override
  GameDetailsImageModel $make(CopyWithData data) => GameDetailsImageModel(
      imageData: data.get(#imageData, or: $value.imageData),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  GameDetailsImageModelCopyWith<$R2, GameDetailsImageModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GameDetailsImageModelCopyWithImpl($value, $cast, t);
}
