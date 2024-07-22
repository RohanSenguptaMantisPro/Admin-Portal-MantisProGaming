// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'image_download.dart';

class ImageDownloadParamsMapper extends ClassMapperBase<ImageDownloadParams> {
  ImageDownloadParamsMapper._();

  static ImageDownloadParamsMapper? _instance;
  static ImageDownloadParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageDownloadParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ImageDownloadParams';

  static String _$userToken(ImageDownloadParams v) => v.userToken;
  static const Field<ImageDownloadParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$fileName(ImageDownloadParams v) => v.fileName;
  static const Field<ImageDownloadParams, String> _f$fileName =
      Field('fileName', _$fileName);

  @override
  final MappableFields<ImageDownloadParams> fields = const {
    #userToken: _f$userToken,
    #fileName: _f$fileName,
  };

  static ImageDownloadParams _instantiate(DecodingData data) {
    return ImageDownloadParams(
        userToken: data.dec(_f$userToken), fileName: data.dec(_f$fileName));
  }

  @override
  final Function instantiate = _instantiate;

  static ImageDownloadParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImageDownloadParams>(map);
  }

  static ImageDownloadParams fromJson(String json) {
    return ensureInitialized().decodeJson<ImageDownloadParams>(json);
  }
}

mixin ImageDownloadParamsMappable {
  String toJson() {
    return ImageDownloadParamsMapper.ensureInitialized()
        .encodeJson<ImageDownloadParams>(this as ImageDownloadParams);
  }

  Map<String, dynamic> toMap() {
    return ImageDownloadParamsMapper.ensureInitialized()
        .encodeMap<ImageDownloadParams>(this as ImageDownloadParams);
  }

  ImageDownloadParamsCopyWith<ImageDownloadParams, ImageDownloadParams,
          ImageDownloadParams>
      get copyWith => _ImageDownloadParamsCopyWithImpl(
          this as ImageDownloadParams, $identity, $identity);
  @override
  String toString() {
    return ImageDownloadParamsMapper.ensureInitialized()
        .stringifyValue(this as ImageDownloadParams);
  }

  @override
  bool operator ==(Object other) {
    return ImageDownloadParamsMapper.ensureInitialized()
        .equalsValue(this as ImageDownloadParams, other);
  }

  @override
  int get hashCode {
    return ImageDownloadParamsMapper.ensureInitialized()
        .hashValue(this as ImageDownloadParams);
  }
}

extension ImageDownloadParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImageDownloadParams, $Out> {
  ImageDownloadParamsCopyWith<$R, ImageDownloadParams, $Out>
      get $asImageDownloadParams =>
          $base.as((v, t, t2) => _ImageDownloadParamsCopyWithImpl(v, t, t2));
}

abstract class ImageDownloadParamsCopyWith<$R, $In extends ImageDownloadParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? fileName});
  ImageDownloadParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImageDownloadParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImageDownloadParams, $Out>
    implements ImageDownloadParamsCopyWith<$R, ImageDownloadParams, $Out> {
  _ImageDownloadParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImageDownloadParams> $mapper =
      ImageDownloadParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? fileName}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (fileName != null) #fileName: fileName
      }));
  @override
  ImageDownloadParams $make(CopyWithData data) => ImageDownloadParams(
      userToken: data.get(#userToken, or: $value.userToken),
      fileName: data.get(#fileName, or: $value.fileName));

  @override
  ImageDownloadParamsCopyWith<$R2, ImageDownloadParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ImageDownloadParamsCopyWithImpl($value, $cast, t);
}
