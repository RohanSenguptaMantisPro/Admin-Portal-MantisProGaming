// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exceptions.dart';

class ServerExceptionMapper extends ClassMapperBase<ServerException> {
  ServerExceptionMapper._();

  static ServerExceptionMapper? _instance;
  static ServerExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ServerException';

  static String _$message(ServerException v) => v.message;
  static const Field<ServerException, String> _f$message =
      Field('message', _$message);
  static String _$statusCode(ServerException v) => v.statusCode;
  static const Field<ServerException, String> _f$statusCode =
      Field('statusCode', _$statusCode);

  @override
  final MappableFields<ServerException> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static ServerException _instantiate(DecodingData data) {
    return ServerException(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerException>(map);
  }

  static ServerException fromJson(String json) {
    return ensureInitialized().decodeJson<ServerException>(json);
  }
}

mixin ServerExceptionMappable {
  String toJson() {
    return ServerExceptionMapper.ensureInitialized()
        .encodeJson<ServerException>(this as ServerException);
  }

  Map<String, dynamic> toMap() {
    return ServerExceptionMapper.ensureInitialized()
        .encodeMap<ServerException>(this as ServerException);
  }

  ServerExceptionCopyWith<ServerException, ServerException, ServerException>
      get copyWith => _ServerExceptionCopyWithImpl(
          this as ServerException, $identity, $identity);
  @override
  String toString() {
    return ServerExceptionMapper.ensureInitialized()
        .stringifyValue(this as ServerException);
  }

  @override
  bool operator ==(Object other) {
    return ServerExceptionMapper.ensureInitialized()
        .equalsValue(this as ServerException, other);
  }

  @override
  int get hashCode {
    return ServerExceptionMapper.ensureInitialized()
        .hashValue(this as ServerException);
  }
}

extension ServerExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerException, $Out> {
  ServerExceptionCopyWith<$R, ServerException, $Out> get $asServerException =>
      $base.as((v, t, t2) => _ServerExceptionCopyWithImpl(v, t, t2));
}

abstract class ServerExceptionCopyWith<$R, $In extends ServerException, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, String? statusCode});
  ServerExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ServerExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerException, $Out>
    implements ServerExceptionCopyWith<$R, ServerException, $Out> {
  _ServerExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerException> $mapper =
      ServerExceptionMapper.ensureInitialized();
  @override
  $R call({String? message, String? statusCode}) => $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != null) #statusCode: statusCode
      }));
  @override
  ServerException $make(CopyWithData data) => ServerException(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  ServerExceptionCopyWith<$R2, ServerException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerExceptionCopyWithImpl($value, $cast, t);
}

class CacheExceptionMapper extends ClassMapperBase<CacheException> {
  CacheExceptionMapper._();

  static CacheExceptionMapper? _instance;
  static CacheExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CacheException';

  static String _$message(CacheException v) => v.message;
  static const Field<CacheException, String> _f$message =
      Field('message', _$message);
  static String _$statusCode(CacheException v) => v.statusCode;
  static const Field<CacheException, String> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true, def: '500');

  @override
  final MappableFields<CacheException> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static CacheException _instantiate(DecodingData data) {
    return CacheException(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheException>(map);
  }

  static CacheException fromJson(String json) {
    return ensureInitialized().decodeJson<CacheException>(json);
  }
}

mixin CacheExceptionMappable {
  String toJson() {
    return CacheExceptionMapper.ensureInitialized()
        .encodeJson<CacheException>(this as CacheException);
  }

  Map<String, dynamic> toMap() {
    return CacheExceptionMapper.ensureInitialized()
        .encodeMap<CacheException>(this as CacheException);
  }

  CacheExceptionCopyWith<CacheException, CacheException, CacheException>
      get copyWith => _CacheExceptionCopyWithImpl(
          this as CacheException, $identity, $identity);
  @override
  String toString() {
    return CacheExceptionMapper.ensureInitialized()
        .stringifyValue(this as CacheException);
  }

  @override
  bool operator ==(Object other) {
    return CacheExceptionMapper.ensureInitialized()
        .equalsValue(this as CacheException, other);
  }

  @override
  int get hashCode {
    return CacheExceptionMapper.ensureInitialized()
        .hashValue(this as CacheException);
  }
}

extension CacheExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheException, $Out> {
  CacheExceptionCopyWith<$R, CacheException, $Out> get $asCacheException =>
      $base.as((v, t, t2) => _CacheExceptionCopyWithImpl(v, t, t2));
}

abstract class CacheExceptionCopyWith<$R, $In extends CacheException, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, String? statusCode});
  CacheExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CacheExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheException, $Out>
    implements CacheExceptionCopyWith<$R, CacheException, $Out> {
  _CacheExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheException> $mapper =
      CacheExceptionMapper.ensureInitialized();
  @override
  $R call({String? message, String? statusCode}) => $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != null) #statusCode: statusCode
      }));
  @override
  CacheException $make(CopyWithData data) => CacheException(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  CacheExceptionCopyWith<$R2, CacheException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheExceptionCopyWithImpl($value, $cast, t);
}
