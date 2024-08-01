// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'download_game_images.dart';

class DownloadGameImagesParamsMapper
    extends ClassMapperBase<DownloadGameImagesParams> {
  DownloadGameImagesParamsMapper._();

  static DownloadGameImagesParamsMapper? _instance;
  static DownloadGameImagesParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownloadGameImagesParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadGameImagesParams';

  static String _$gameObjectId(DownloadGameImagesParams v) => v.gameObjectId;
  static const Field<DownloadGameImagesParams, String> _f$gameObjectId =
      Field('gameObjectId', _$gameObjectId);
  static String _$imageAssetName(DownloadGameImagesParams v) =>
      v.imageAssetName;
  static const Field<DownloadGameImagesParams, String> _f$imageAssetName =
      Field('imageAssetName', _$imageAssetName);

  @override
  final MappableFields<DownloadGameImagesParams> fields = const {
    #gameObjectId: _f$gameObjectId,
    #imageAssetName: _f$imageAssetName,
  };

  static DownloadGameImagesParams _instantiate(DecodingData data) {
    return DownloadGameImagesParams(
        gameObjectId: data.dec(_f$gameObjectId),
        imageAssetName: data.dec(_f$imageAssetName));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadGameImagesParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadGameImagesParams>(map);
  }

  static DownloadGameImagesParams fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadGameImagesParams>(json);
  }
}

mixin DownloadGameImagesParamsMappable {
  String toJson() {
    return DownloadGameImagesParamsMapper.ensureInitialized()
        .encodeJson<DownloadGameImagesParams>(this as DownloadGameImagesParams);
  }

  Map<String, dynamic> toMap() {
    return DownloadGameImagesParamsMapper.ensureInitialized()
        .encodeMap<DownloadGameImagesParams>(this as DownloadGameImagesParams);
  }

  DownloadGameImagesParamsCopyWith<DownloadGameImagesParams,
          DownloadGameImagesParams, DownloadGameImagesParams>
      get copyWith => _DownloadGameImagesParamsCopyWithImpl(
          this as DownloadGameImagesParams, $identity, $identity);
  @override
  String toString() {
    return DownloadGameImagesParamsMapper.ensureInitialized()
        .stringifyValue(this as DownloadGameImagesParams);
  }

  @override
  bool operator ==(Object other) {
    return DownloadGameImagesParamsMapper.ensureInitialized()
        .equalsValue(this as DownloadGameImagesParams, other);
  }

  @override
  int get hashCode {
    return DownloadGameImagesParamsMapper.ensureInitialized()
        .hashValue(this as DownloadGameImagesParams);
  }
}

extension DownloadGameImagesParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadGameImagesParams, $Out> {
  DownloadGameImagesParamsCopyWith<$R, DownloadGameImagesParams, $Out>
      get $asDownloadGameImagesParams => $base
          .as((v, t, t2) => _DownloadGameImagesParamsCopyWithImpl(v, t, t2));
}

abstract class DownloadGameImagesParamsCopyWith<
    $R,
    $In extends DownloadGameImagesParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? gameObjectId, String? imageAssetName});
  DownloadGameImagesParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadGameImagesParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadGameImagesParams, $Out>
    implements
        DownloadGameImagesParamsCopyWith<$R, DownloadGameImagesParams, $Out> {
  _DownloadGameImagesParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadGameImagesParams> $mapper =
      DownloadGameImagesParamsMapper.ensureInitialized();
  @override
  $R call({String? gameObjectId, String? imageAssetName}) =>
      $apply(FieldCopyWithData({
        if (gameObjectId != null) #gameObjectId: gameObjectId,
        if (imageAssetName != null) #imageAssetName: imageAssetName
      }));
  @override
  DownloadGameImagesParams $make(CopyWithData data) => DownloadGameImagesParams(
      gameObjectId: data.get(#gameObjectId, or: $value.gameObjectId),
      imageAssetName: data.get(#imageAssetName, or: $value.imageAssetName));

  @override
  DownloadGameImagesParamsCopyWith<$R2, DownloadGameImagesParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadGameImagesParamsCopyWithImpl($value, $cast, t);
}
