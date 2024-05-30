// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'failures.dart';

class FailureMapper extends ClassMapperBase<Failure> {
  FailureMapper._();

  static FailureMapper? _instance;
  static FailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FailureMapper._());
      CacheFailureMapper.ensureInitialized();
      ServerFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Failure';

  static String _$message(Failure v) => v.message;
  static const Field<Failure, String> _f$message = Field('message', _$message);
  static dynamic _$statusCode(Failure v) => v.statusCode;
  static const Field<Failure, dynamic> _f$statusCode =
      Field('statusCode', _$statusCode);

  @override
  final MappableFields<Failure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static Failure _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Failure');
  }

  @override
  final Function instantiate = _instantiate;

  static Failure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Failure>(map);
  }

  static Failure fromJson(String json) {
    return ensureInitialized().decodeJson<Failure>(json);
  }
}

mixin FailureMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FailureCopyWith<Failure, Failure, Failure> get copyWith;
}

abstract class FailureCopyWith<$R, $In extends Failure, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, dynamic statusCode});
  FailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CacheFailureMapper extends ClassMapperBase<CacheFailure> {
  CacheFailureMapper._();

  static CacheFailureMapper? _instance;
  static CacheFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheFailureMapper._());
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CacheFailure';

  static String _$message(CacheFailure v) => v.message;
  static const Field<CacheFailure, String> _f$message =
      Field('message', _$message);
  static dynamic _$statusCode(CacheFailure v) => v.statusCode;
  static const Field<CacheFailure, dynamic> _f$statusCode =
      Field('statusCode', _$statusCode);

  @override
  final MappableFields<CacheFailure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static CacheFailure _instantiate(DecodingData data) {
    return CacheFailure(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheFailure>(map);
  }

  static CacheFailure fromJson(String json) {
    return ensureInitialized().decodeJson<CacheFailure>(json);
  }
}

mixin CacheFailureMappable {
  String toJson() {
    return CacheFailureMapper.ensureInitialized()
        .encodeJson<CacheFailure>(this as CacheFailure);
  }

  Map<String, dynamic> toMap() {
    return CacheFailureMapper.ensureInitialized()
        .encodeMap<CacheFailure>(this as CacheFailure);
  }

  CacheFailureCopyWith<CacheFailure, CacheFailure, CacheFailure> get copyWith =>
      _CacheFailureCopyWithImpl(this as CacheFailure, $identity, $identity);
  @override
  String toString() {
    return CacheFailureMapper.ensureInitialized()
        .stringifyValue(this as CacheFailure);
  }

  @override
  bool operator ==(Object other) {
    return CacheFailureMapper.ensureInitialized()
        .equalsValue(this as CacheFailure, other);
  }

  @override
  int get hashCode {
    return CacheFailureMapper.ensureInitialized()
        .hashValue(this as CacheFailure);
  }
}

extension CacheFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheFailure, $Out> {
  CacheFailureCopyWith<$R, CacheFailure, $Out> get $asCacheFailure =>
      $base.as((v, t, t2) => _CacheFailureCopyWithImpl(v, t, t2));
}

abstract class CacheFailureCopyWith<$R, $In extends CacheFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, dynamic statusCode});
  CacheFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CacheFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheFailure, $Out>
    implements CacheFailureCopyWith<$R, CacheFailure, $Out> {
  _CacheFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheFailure> $mapper =
      CacheFailureMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  CacheFailure $make(CopyWithData data) => CacheFailure(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  CacheFailureCopyWith<$R2, CacheFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheFailureCopyWithImpl($value, $cast, t);
}

class ServerFailureMapper extends ClassMapperBase<ServerFailure> {
  ServerFailureMapper._();

  static ServerFailureMapper? _instance;
  static ServerFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerFailureMapper._());
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ServerFailure';

  static String _$message(ServerFailure v) => v.message;
  static const Field<ServerFailure, String> _f$message =
      Field('message', _$message);
  static dynamic _$statusCode(ServerFailure v) => v.statusCode;
  static const Field<ServerFailure, dynamic> _f$statusCode =
      Field('statusCode', _$statusCode);

  @override
  final MappableFields<ServerFailure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static ServerFailure _instantiate(DecodingData data) {
    return ServerFailure(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerFailure>(map);
  }

  static ServerFailure fromJson(String json) {
    return ensureInitialized().decodeJson<ServerFailure>(json);
  }
}

mixin ServerFailureMappable {
  String toJson() {
    return ServerFailureMapper.ensureInitialized()
        .encodeJson<ServerFailure>(this as ServerFailure);
  }

  Map<String, dynamic> toMap() {
    return ServerFailureMapper.ensureInitialized()
        .encodeMap<ServerFailure>(this as ServerFailure);
  }

  ServerFailureCopyWith<ServerFailure, ServerFailure, ServerFailure>
      get copyWith => _ServerFailureCopyWithImpl(
          this as ServerFailure, $identity, $identity);
  @override
  String toString() {
    return ServerFailureMapper.ensureInitialized()
        .stringifyValue(this as ServerFailure);
  }

  @override
  bool operator ==(Object other) {
    return ServerFailureMapper.ensureInitialized()
        .equalsValue(this as ServerFailure, other);
  }

  @override
  int get hashCode {
    return ServerFailureMapper.ensureInitialized()
        .hashValue(this as ServerFailure);
  }
}

extension ServerFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerFailure, $Out> {
  ServerFailureCopyWith<$R, ServerFailure, $Out> get $asServerFailure =>
      $base.as((v, t, t2) => _ServerFailureCopyWithImpl(v, t, t2));
}

abstract class ServerFailureCopyWith<$R, $In extends ServerFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, dynamic statusCode});
  ServerFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerFailure, $Out>
    implements ServerFailureCopyWith<$R, ServerFailure, $Out> {
  _ServerFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerFailure> $mapper =
      ServerFailureMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  ServerFailure $make(CopyWithData data) => ServerFailure(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  ServerFailureCopyWith<$R2, ServerFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerFailureCopyWithImpl($value, $cast, t);
}
