// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_image.dart';

class ServerImageMapper extends ClassMapperBase<ServerImage> {
  ServerImageMapper._();

  static ServerImageMapper? _instance;
  static ServerImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerImageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServerImage';

  static Uint8List? _$imageData(ServerImage v) => v.imageData;
  static const Field<ServerImage, Uint8List> _f$imageData =
      Field('imageData', _$imageData, opt: true);
  static String? _$imageType(ServerImage v) => v.imageType;
  static const Field<ServerImage, String> _f$imageType =
      Field('imageType', _$imageType, opt: true);

  @override
  final MappableFields<ServerImage> fields = const {
    #imageData: _f$imageData,
    #imageType: _f$imageType,
  };

  static ServerImage _instantiate(DecodingData data) {
    return ServerImage(
        imageData: data.dec(_f$imageData), imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerImage>(map);
  }

  static ServerImage fromJson(String json) {
    return ensureInitialized().decodeJson<ServerImage>(json);
  }
}

mixin ServerImageMappable {
  String toJson() {
    return ServerImageMapper.ensureInitialized()
        .encodeJson<ServerImage>(this as ServerImage);
  }

  Map<String, dynamic> toMap() {
    return ServerImageMapper.ensureInitialized()
        .encodeMap<ServerImage>(this as ServerImage);
  }

  ServerImageCopyWith<ServerImage, ServerImage, ServerImage> get copyWith =>
      _ServerImageCopyWithImpl(this as ServerImage, $identity, $identity);
  @override
  String toString() {
    return ServerImageMapper.ensureInitialized()
        .stringifyValue(this as ServerImage);
  }

  @override
  bool operator ==(Object other) {
    return ServerImageMapper.ensureInitialized()
        .equalsValue(this as ServerImage, other);
  }

  @override
  int get hashCode {
    return ServerImageMapper.ensureInitialized().hashValue(this as ServerImage);
  }
}

extension ServerImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerImage, $Out> {
  ServerImageCopyWith<$R, ServerImage, $Out> get $asServerImage =>
      $base.as((v, t, t2) => _ServerImageCopyWithImpl(v, t, t2));
}

abstract class ServerImageCopyWith<$R, $In extends ServerImage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Uint8List? imageData, String? imageType});
  ServerImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerImage, $Out>
    implements ServerImageCopyWith<$R, ServerImage, $Out> {
  _ServerImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerImage> $mapper =
      ServerImageMapper.ensureInitialized();
  @override
  $R call({Object? imageData = $none, Object? imageType = $none}) =>
      $apply(FieldCopyWithData({
        if (imageData != $none) #imageData: imageData,
        if (imageType != $none) #imageType: imageType
      }));
  @override
  ServerImage $make(CopyWithData data) => ServerImage(
      imageData: data.get(#imageData, or: $value.imageData),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  ServerImageCopyWith<$R2, ServerImage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerImageCopyWithImpl($value, $cast, t);
}
