// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upload_game_images.dart';

class UploadGameImagesParamsMapper
    extends ClassMapperBase<UploadGameImagesParams> {
  UploadGameImagesParamsMapper._();

  static UploadGameImagesParamsMapper? _instance;
  static UploadGameImagesParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadGameImagesParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UploadGameImagesParams';

  static String _$userToken(UploadGameImagesParams v) => v.userToken;
  static const Field<UploadGameImagesParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static XFile _$imageFile(UploadGameImagesParams v) => v.imageFile;
  static const Field<UploadGameImagesParams, XFile> _f$imageFile =
      Field('imageFile', _$imageFile);
  static String _$imageAssetName(UploadGameImagesParams v) => v.imageAssetName;
  static const Field<UploadGameImagesParams, String> _f$imageAssetName =
      Field('imageAssetName', _$imageAssetName);
  static String _$gameObjectId(UploadGameImagesParams v) => v.gameObjectId;
  static const Field<UploadGameImagesParams, String> _f$gameObjectId =
      Field('gameObjectId', _$gameObjectId);

  @override
  final MappableFields<UploadGameImagesParams> fields = const {
    #userToken: _f$userToken,
    #imageFile: _f$imageFile,
    #imageAssetName: _f$imageAssetName,
    #gameObjectId: _f$gameObjectId,
  };

  static UploadGameImagesParams _instantiate(DecodingData data) {
    return UploadGameImagesParams(
        userToken: data.dec(_f$userToken),
        imageFile: data.dec(_f$imageFile),
        imageAssetName: data.dec(_f$imageAssetName),
        gameObjectId: data.dec(_f$gameObjectId));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadGameImagesParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadGameImagesParams>(map);
  }

  static UploadGameImagesParams fromJson(String json) {
    return ensureInitialized().decodeJson<UploadGameImagesParams>(json);
  }
}

mixin UploadGameImagesParamsMappable {
  String toJson() {
    return UploadGameImagesParamsMapper.ensureInitialized()
        .encodeJson<UploadGameImagesParams>(this as UploadGameImagesParams);
  }

  Map<String, dynamic> toMap() {
    return UploadGameImagesParamsMapper.ensureInitialized()
        .encodeMap<UploadGameImagesParams>(this as UploadGameImagesParams);
  }

  UploadGameImagesParamsCopyWith<UploadGameImagesParams, UploadGameImagesParams,
          UploadGameImagesParams>
      get copyWith => _UploadGameImagesParamsCopyWithImpl(
          this as UploadGameImagesParams, $identity, $identity);
  @override
  String toString() {
    return UploadGameImagesParamsMapper.ensureInitialized()
        .stringifyValue(this as UploadGameImagesParams);
  }

  @override
  bool operator ==(Object other) {
    return UploadGameImagesParamsMapper.ensureInitialized()
        .equalsValue(this as UploadGameImagesParams, other);
  }

  @override
  int get hashCode {
    return UploadGameImagesParamsMapper.ensureInitialized()
        .hashValue(this as UploadGameImagesParams);
  }
}

extension UploadGameImagesParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadGameImagesParams, $Out> {
  UploadGameImagesParamsCopyWith<$R, UploadGameImagesParams, $Out>
      get $asUploadGameImagesParams =>
          $base.as((v, t, t2) => _UploadGameImagesParamsCopyWithImpl(v, t, t2));
}

abstract class UploadGameImagesParamsCopyWith<
    $R,
    $In extends UploadGameImagesParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? userToken,
      XFile? imageFile,
      String? imageAssetName,
      String? gameObjectId});
  UploadGameImagesParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadGameImagesParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadGameImagesParams, $Out>
    implements
        UploadGameImagesParamsCopyWith<$R, UploadGameImagesParams, $Out> {
  _UploadGameImagesParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadGameImagesParams> $mapper =
      UploadGameImagesParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? userToken,
          XFile? imageFile,
          String? imageAssetName,
          String? gameObjectId}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (imageFile != null) #imageFile: imageFile,
        if (imageAssetName != null) #imageAssetName: imageAssetName,
        if (gameObjectId != null) #gameObjectId: gameObjectId
      }));
  @override
  UploadGameImagesParams $make(CopyWithData data) => UploadGameImagesParams(
      userToken: data.get(#userToken, or: $value.userToken),
      imageFile: data.get(#imageFile, or: $value.imageFile),
      imageAssetName: data.get(#imageAssetName, or: $value.imageAssetName),
      gameObjectId: data.get(#gameObjectId, or: $value.gameObjectId));

  @override
  UploadGameImagesParamsCopyWith<$R2, UploadGameImagesParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UploadGameImagesParamsCopyWithImpl($value, $cast, t);
}
