// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_details_image.dart';

class GameDetailsImageMapper extends ClassMapperBase<GameDetailsImage> {
  GameDetailsImageMapper._();

  static GameDetailsImageMapper? _instance;
  static GameDetailsImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsImageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsImage';

  static Uint8List? _$imageData(GameDetailsImage v) => v.imageData;
  static const Field<GameDetailsImage, Uint8List> _f$imageData =
      Field('imageData', _$imageData, opt: true);
  static String? _$imageType(GameDetailsImage v) => v.imageType;
  static const Field<GameDetailsImage, String> _f$imageType =
      Field('imageType', _$imageType, opt: true);

  @override
  final MappableFields<GameDetailsImage> fields = const {
    #imageData: _f$imageData,
    #imageType: _f$imageType,
  };

  static GameDetailsImage _instantiate(DecodingData data) {
    return GameDetailsImage(
        imageData: data.dec(_f$imageData), imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsImage>(map);
  }

  static GameDetailsImage fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsImage>(json);
  }
}

mixin GameDetailsImageMappable {
  String toJson() {
    return GameDetailsImageMapper.ensureInitialized()
        .encodeJson<GameDetailsImage>(this as GameDetailsImage);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsImageMapper.ensureInitialized()
        .encodeMap<GameDetailsImage>(this as GameDetailsImage);
  }

  GameDetailsImageCopyWith<GameDetailsImage, GameDetailsImage, GameDetailsImage>
      get copyWith => _GameDetailsImageCopyWithImpl(
          this as GameDetailsImage, $identity, $identity);
  @override
  String toString() {
    return GameDetailsImageMapper.ensureInitialized()
        .stringifyValue(this as GameDetailsImage);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsImageMapper.ensureInitialized()
        .equalsValue(this as GameDetailsImage, other);
  }

  @override
  int get hashCode {
    return GameDetailsImageMapper.ensureInitialized()
        .hashValue(this as GameDetailsImage);
  }
}

extension GameDetailsImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetailsImage, $Out> {
  GameDetailsImageCopyWith<$R, GameDetailsImage, $Out>
      get $asGameDetailsImage =>
          $base.as((v, t, t2) => _GameDetailsImageCopyWithImpl(v, t, t2));
}

abstract class GameDetailsImageCopyWith<$R, $In extends GameDetailsImage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Uint8List? imageData, String? imageType});
  GameDetailsImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameDetailsImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetailsImage, $Out>
    implements GameDetailsImageCopyWith<$R, GameDetailsImage, $Out> {
  _GameDetailsImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetailsImage> $mapper =
      GameDetailsImageMapper.ensureInitialized();
  @override
  $R call({Object? imageData = $none, Object? imageType = $none}) =>
      $apply(FieldCopyWithData({
        if (imageData != $none) #imageData: imageData,
        if (imageType != $none) #imageType: imageType
      }));
  @override
  GameDetailsImage $make(CopyWithData data) => GameDetailsImage(
      imageData: data.get(#imageData, or: $value.imageData),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  GameDetailsImageCopyWith<$R2, GameDetailsImage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDetailsImageCopyWithImpl($value, $cast, t);
}
