// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_image_model.dart';

class ServerImageModelMapper extends SubClassMapperBase<ServerImageModel> {
  ServerImageModelMapper._();

  static ServerImageModelMapper? _instance;
  static ServerImageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerImageModelMapper._());
      ServerImageMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ServerImageModel';

  static Uint8List? _$imageData(ServerImageModel v) => v.imageData;
  static const Field<ServerImageModel, Uint8List> _f$imageData =
      Field('imageData', _$imageData, opt: true);
  static String? _$imageType(ServerImageModel v) => v.imageType;
  static const Field<ServerImageModel, String> _f$imageType =
      Field('imageType', _$imageType, opt: true);

  @override
  final MappableFields<ServerImageModel> fields = const {
    #imageData: _f$imageData,
    #imageType: _f$imageType,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'serverImageModel';
  @override
  late final ClassMapperBase superMapper =
      ServerImageMapper.ensureInitialized();

  static ServerImageModel _instantiate(DecodingData data) {
    return ServerImageModel(
        imageData: data.dec(_f$imageData), imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerImageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerImageModel>(map);
  }

  static ServerImageModel fromJson(String json) {
    return ensureInitialized().decodeJson<ServerImageModel>(json);
  }
}

mixin ServerImageModelMappable {
  String toJson() {
    return ServerImageModelMapper.ensureInitialized()
        .encodeJson<ServerImageModel>(this as ServerImageModel);
  }

  Map<String, dynamic> toMap() {
    return ServerImageModelMapper.ensureInitialized()
        .encodeMap<ServerImageModel>(this as ServerImageModel);
  }

  ServerImageModelCopyWith<ServerImageModel, ServerImageModel, ServerImageModel>
      get copyWith => _ServerImageModelCopyWithImpl(
          this as ServerImageModel, $identity, $identity);
  @override
  String toString() {
    return ServerImageModelMapper.ensureInitialized()
        .stringifyValue(this as ServerImageModel);
  }

  @override
  bool operator ==(Object other) {
    return ServerImageModelMapper.ensureInitialized()
        .equalsValue(this as ServerImageModel, other);
  }

  @override
  int get hashCode {
    return ServerImageModelMapper.ensureInitialized()
        .hashValue(this as ServerImageModel);
  }
}

extension ServerImageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerImageModel, $Out> {
  ServerImageModelCopyWith<$R, ServerImageModel, $Out>
      get $asServerImageModel =>
          $base.as((v, t, t2) => _ServerImageModelCopyWithImpl(v, t, t2));
}

abstract class ServerImageModelCopyWith<$R, $In extends ServerImageModel, $Out>
    implements ServerImageCopyWith<$R, $In, $Out> {
  @override
  $R call({Uint8List? imageData, String? imageType});
  ServerImageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServerImageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerImageModel, $Out>
    implements ServerImageModelCopyWith<$R, ServerImageModel, $Out> {
  _ServerImageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerImageModel> $mapper =
      ServerImageModelMapper.ensureInitialized();
  @override
  $R call({Object? imageData = $none, Object? imageType = $none}) =>
      $apply(FieldCopyWithData({
        if (imageData != $none) #imageData: imageData,
        if (imageType != $none) #imageType: imageType
      }));
  @override
  ServerImageModel $make(CopyWithData data) => ServerImageModel(
      imageData: data.get(#imageData, or: $value.imageData),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  ServerImageModelCopyWith<$R2, ServerImageModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerImageModelCopyWithImpl($value, $cast, t);
}
