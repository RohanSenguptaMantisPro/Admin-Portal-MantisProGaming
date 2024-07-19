// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'image_upload.dart';

class ImageUploadParamsMapper extends ClassMapperBase<ImageUploadParams> {
  ImageUploadParamsMapper._();

  static ImageUploadParamsMapper? _instance;
  static ImageUploadParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageUploadParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ImageUploadParams';

  static String _$userToken(ImageUploadParams v) => v.userToken;
  static const Field<ImageUploadParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static File _$imageFile(ImageUploadParams v) => v.imageFile;
  static const Field<ImageUploadParams, File> _f$imageFile =
      Field('imageFile', _$imageFile);

  @override
  final MappableFields<ImageUploadParams> fields = const {
    #userToken: _f$userToken,
    #imageFile: _f$imageFile,
  };

  static ImageUploadParams _instantiate(DecodingData data) {
    return ImageUploadParams(
        userToken: data.dec(_f$userToken), imageFile: data.dec(_f$imageFile));
  }

  @override
  final Function instantiate = _instantiate;

  static ImageUploadParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImageUploadParams>(map);
  }

  static ImageUploadParams fromJson(String json) {
    return ensureInitialized().decodeJson<ImageUploadParams>(json);
  }
}

mixin ImageUploadParamsMappable {
  String toJson() {
    return ImageUploadParamsMapper.ensureInitialized()
        .encodeJson<ImageUploadParams>(this as ImageUploadParams);
  }

  Map<String, dynamic> toMap() {
    return ImageUploadParamsMapper.ensureInitialized()
        .encodeMap<ImageUploadParams>(this as ImageUploadParams);
  }

  ImageUploadParamsCopyWith<ImageUploadParams, ImageUploadParams,
          ImageUploadParams>
      get copyWith => _ImageUploadParamsCopyWithImpl(
          this as ImageUploadParams, $identity, $identity);
  @override
  String toString() {
    return ImageUploadParamsMapper.ensureInitialized()
        .stringifyValue(this as ImageUploadParams);
  }

  @override
  bool operator ==(Object other) {
    return ImageUploadParamsMapper.ensureInitialized()
        .equalsValue(this as ImageUploadParams, other);
  }

  @override
  int get hashCode {
    return ImageUploadParamsMapper.ensureInitialized()
        .hashValue(this as ImageUploadParams);
  }
}

extension ImageUploadParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImageUploadParams, $Out> {
  ImageUploadParamsCopyWith<$R, ImageUploadParams, $Out>
      get $asImageUploadParams =>
          $base.as((v, t, t2) => _ImageUploadParamsCopyWithImpl(v, t, t2));
}

abstract class ImageUploadParamsCopyWith<$R, $In extends ImageUploadParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, File? imageFile});
  ImageUploadParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImageUploadParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImageUploadParams, $Out>
    implements ImageUploadParamsCopyWith<$R, ImageUploadParams, $Out> {
  _ImageUploadParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImageUploadParams> $mapper =
      ImageUploadParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, File? imageFile}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (imageFile != null) #imageFile: imageFile
      }));
  @override
  ImageUploadParams $make(CopyWithData data) => ImageUploadParams(
      userToken: data.get(#userToken, or: $value.userToken),
      imageFile: data.get(#imageFile, or: $value.imageFile));

  @override
  ImageUploadParamsCopyWith<$R2, ImageUploadParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ImageUploadParamsCopyWithImpl($value, $cast, t);
}
