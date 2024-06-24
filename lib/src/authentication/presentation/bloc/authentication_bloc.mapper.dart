// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'authentication_bloc.dart';

class AuthEventMapper extends ClassMapperBase<AuthEvent> {
  AuthEventMapper._();

  static AuthEventMapper? _instance;
  static AuthEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthEventMapper._());
      CreateUserEventMapper.ensureInitialized();
      IsAdminEventMapper.ensureInitialized();
      CacheUserTokenEventMapper.ensureInitialized();
      IsUserLoggedInEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthEvent';

  @override
  final MappableFields<AuthEvent> fields = const {};

  static AuthEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AuthEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static AuthEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthEvent>(map);
  }

  static AuthEvent fromJson(String json) {
    return ensureInitialized().decodeJson<AuthEvent>(json);
  }
}

mixin AuthEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AuthEventCopyWith<AuthEvent, AuthEvent, AuthEvent> get copyWith;
}

abstract class AuthEventCopyWith<$R, $In extends AuthEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AuthEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class CreateUserEventMapper extends ClassMapperBase<CreateUserEvent> {
  CreateUserEventMapper._();

  static CreateUserEventMapper? _instance;
  static CreateUserEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateUserEventMapper._());
      AuthEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreateUserEvent';

  @override
  final MappableFields<CreateUserEvent> fields = const {};

  static CreateUserEvent _instantiate(DecodingData data) {
    return CreateUserEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static CreateUserEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateUserEvent>(map);
  }

  static CreateUserEvent fromJson(String json) {
    return ensureInitialized().decodeJson<CreateUserEvent>(json);
  }
}

mixin CreateUserEventMappable {
  String toJson() {
    return CreateUserEventMapper.ensureInitialized()
        .encodeJson<CreateUserEvent>(this as CreateUserEvent);
  }

  Map<String, dynamic> toMap() {
    return CreateUserEventMapper.ensureInitialized()
        .encodeMap<CreateUserEvent>(this as CreateUserEvent);
  }

  CreateUserEventCopyWith<CreateUserEvent, CreateUserEvent, CreateUserEvent>
      get copyWith => _CreateUserEventCopyWithImpl(
          this as CreateUserEvent, $identity, $identity);
  @override
  String toString() {
    return CreateUserEventMapper.ensureInitialized()
        .stringifyValue(this as CreateUserEvent);
  }

  @override
  bool operator ==(Object other) {
    return CreateUserEventMapper.ensureInitialized()
        .equalsValue(this as CreateUserEvent, other);
  }

  @override
  int get hashCode {
    return CreateUserEventMapper.ensureInitialized()
        .hashValue(this as CreateUserEvent);
  }
}

extension CreateUserEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateUserEvent, $Out> {
  CreateUserEventCopyWith<$R, CreateUserEvent, $Out> get $asCreateUserEvent =>
      $base.as((v, t, t2) => _CreateUserEventCopyWithImpl(v, t, t2));
}

abstract class CreateUserEventCopyWith<$R, $In extends CreateUserEvent, $Out>
    implements AuthEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  CreateUserEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateUserEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateUserEvent, $Out>
    implements CreateUserEventCopyWith<$R, CreateUserEvent, $Out> {
  _CreateUserEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateUserEvent> $mapper =
      CreateUserEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  CreateUserEvent $make(CopyWithData data) => CreateUserEvent();

  @override
  CreateUserEventCopyWith<$R2, CreateUserEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateUserEventCopyWithImpl($value, $cast, t);
}

class IsAdminEventMapper extends ClassMapperBase<IsAdminEvent> {
  IsAdminEventMapper._();

  static IsAdminEventMapper? _instance;
  static IsAdminEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsAdminEventMapper._());
      AuthEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsAdminEvent';

  static String _$userToken(IsAdminEvent v) => v.userToken;
  static const Field<IsAdminEvent, String> _f$userToken =
      Field('userToken', _$userToken);

  @override
  final MappableFields<IsAdminEvent> fields = const {
    #userToken: _f$userToken,
  };

  static IsAdminEvent _instantiate(DecodingData data) {
    return IsAdminEvent(userToken: data.dec(_f$userToken));
  }

  @override
  final Function instantiate = _instantiate;

  static IsAdminEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsAdminEvent>(map);
  }

  static IsAdminEvent fromJson(String json) {
    return ensureInitialized().decodeJson<IsAdminEvent>(json);
  }
}

mixin IsAdminEventMappable {
  String toJson() {
    return IsAdminEventMapper.ensureInitialized()
        .encodeJson<IsAdminEvent>(this as IsAdminEvent);
  }

  Map<String, dynamic> toMap() {
    return IsAdminEventMapper.ensureInitialized()
        .encodeMap<IsAdminEvent>(this as IsAdminEvent);
  }

  IsAdminEventCopyWith<IsAdminEvent, IsAdminEvent, IsAdminEvent> get copyWith =>
      _IsAdminEventCopyWithImpl(this as IsAdminEvent, $identity, $identity);
  @override
  String toString() {
    return IsAdminEventMapper.ensureInitialized()
        .stringifyValue(this as IsAdminEvent);
  }

  @override
  bool operator ==(Object other) {
    return IsAdminEventMapper.ensureInitialized()
        .equalsValue(this as IsAdminEvent, other);
  }

  @override
  int get hashCode {
    return IsAdminEventMapper.ensureInitialized()
        .hashValue(this as IsAdminEvent);
  }
}

extension IsAdminEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsAdminEvent, $Out> {
  IsAdminEventCopyWith<$R, IsAdminEvent, $Out> get $asIsAdminEvent =>
      $base.as((v, t, t2) => _IsAdminEventCopyWithImpl(v, t, t2));
}

abstract class IsAdminEventCopyWith<$R, $In extends IsAdminEvent, $Out>
    implements AuthEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken});
  IsAdminEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IsAdminEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsAdminEvent, $Out>
    implements IsAdminEventCopyWith<$R, IsAdminEvent, $Out> {
  _IsAdminEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsAdminEvent> $mapper =
      IsAdminEventMapper.ensureInitialized();
  @override
  $R call({String? userToken}) =>
      $apply(FieldCopyWithData({if (userToken != null) #userToken: userToken}));
  @override
  IsAdminEvent $make(CopyWithData data) =>
      IsAdminEvent(userToken: data.get(#userToken, or: $value.userToken));

  @override
  IsAdminEventCopyWith<$R2, IsAdminEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsAdminEventCopyWithImpl($value, $cast, t);
}

class CacheUserTokenEventMapper extends ClassMapperBase<CacheUserTokenEvent> {
  CacheUserTokenEventMapper._();

  static CacheUserTokenEventMapper? _instance;
  static CacheUserTokenEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheUserTokenEventMapper._());
      AuthEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CacheUserTokenEvent';

  static String _$userToken(CacheUserTokenEvent v) => v.userToken;
  static const Field<CacheUserTokenEvent, String> _f$userToken =
      Field('userToken', _$userToken);

  @override
  final MappableFields<CacheUserTokenEvent> fields = const {
    #userToken: _f$userToken,
  };

  static CacheUserTokenEvent _instantiate(DecodingData data) {
    return CacheUserTokenEvent(data.dec(_f$userToken));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheUserTokenEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheUserTokenEvent>(map);
  }

  static CacheUserTokenEvent fromJson(String json) {
    return ensureInitialized().decodeJson<CacheUserTokenEvent>(json);
  }
}

mixin CacheUserTokenEventMappable {
  String toJson() {
    return CacheUserTokenEventMapper.ensureInitialized()
        .encodeJson<CacheUserTokenEvent>(this as CacheUserTokenEvent);
  }

  Map<String, dynamic> toMap() {
    return CacheUserTokenEventMapper.ensureInitialized()
        .encodeMap<CacheUserTokenEvent>(this as CacheUserTokenEvent);
  }

  CacheUserTokenEventCopyWith<CacheUserTokenEvent, CacheUserTokenEvent,
          CacheUserTokenEvent>
      get copyWith => _CacheUserTokenEventCopyWithImpl(
          this as CacheUserTokenEvent, $identity, $identity);
  @override
  String toString() {
    return CacheUserTokenEventMapper.ensureInitialized()
        .stringifyValue(this as CacheUserTokenEvent);
  }

  @override
  bool operator ==(Object other) {
    return CacheUserTokenEventMapper.ensureInitialized()
        .equalsValue(this as CacheUserTokenEvent, other);
  }

  @override
  int get hashCode {
    return CacheUserTokenEventMapper.ensureInitialized()
        .hashValue(this as CacheUserTokenEvent);
  }
}

extension CacheUserTokenEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheUserTokenEvent, $Out> {
  CacheUserTokenEventCopyWith<$R, CacheUserTokenEvent, $Out>
      get $asCacheUserTokenEvent =>
          $base.as((v, t, t2) => _CacheUserTokenEventCopyWithImpl(v, t, t2));
}

abstract class CacheUserTokenEventCopyWith<$R, $In extends CacheUserTokenEvent,
    $Out> implements AuthEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken});
  CacheUserTokenEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CacheUserTokenEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheUserTokenEvent, $Out>
    implements CacheUserTokenEventCopyWith<$R, CacheUserTokenEvent, $Out> {
  _CacheUserTokenEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheUserTokenEvent> $mapper =
      CacheUserTokenEventMapper.ensureInitialized();
  @override
  $R call({String? userToken}) =>
      $apply(FieldCopyWithData({if (userToken != null) #userToken: userToken}));
  @override
  CacheUserTokenEvent $make(CopyWithData data) =>
      CacheUserTokenEvent(data.get(#userToken, or: $value.userToken));

  @override
  CacheUserTokenEventCopyWith<$R2, CacheUserTokenEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CacheUserTokenEventCopyWithImpl($value, $cast, t);
}

class IsUserLoggedInEventMapper extends ClassMapperBase<IsUserLoggedInEvent> {
  IsUserLoggedInEventMapper._();

  static IsUserLoggedInEventMapper? _instance;
  static IsUserLoggedInEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsUserLoggedInEventMapper._());
      AuthEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsUserLoggedInEvent';

  @override
  final MappableFields<IsUserLoggedInEvent> fields = const {};

  static IsUserLoggedInEvent _instantiate(DecodingData data) {
    return IsUserLoggedInEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static IsUserLoggedInEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsUserLoggedInEvent>(map);
  }

  static IsUserLoggedInEvent fromJson(String json) {
    return ensureInitialized().decodeJson<IsUserLoggedInEvent>(json);
  }
}

mixin IsUserLoggedInEventMappable {
  String toJson() {
    return IsUserLoggedInEventMapper.ensureInitialized()
        .encodeJson<IsUserLoggedInEvent>(this as IsUserLoggedInEvent);
  }

  Map<String, dynamic> toMap() {
    return IsUserLoggedInEventMapper.ensureInitialized()
        .encodeMap<IsUserLoggedInEvent>(this as IsUserLoggedInEvent);
  }

  IsUserLoggedInEventCopyWith<IsUserLoggedInEvent, IsUserLoggedInEvent,
          IsUserLoggedInEvent>
      get copyWith => _IsUserLoggedInEventCopyWithImpl(
          this as IsUserLoggedInEvent, $identity, $identity);
  @override
  String toString() {
    return IsUserLoggedInEventMapper.ensureInitialized()
        .stringifyValue(this as IsUserLoggedInEvent);
  }

  @override
  bool operator ==(Object other) {
    return IsUserLoggedInEventMapper.ensureInitialized()
        .equalsValue(this as IsUserLoggedInEvent, other);
  }

  @override
  int get hashCode {
    return IsUserLoggedInEventMapper.ensureInitialized()
        .hashValue(this as IsUserLoggedInEvent);
  }
}

extension IsUserLoggedInEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsUserLoggedInEvent, $Out> {
  IsUserLoggedInEventCopyWith<$R, IsUserLoggedInEvent, $Out>
      get $asIsUserLoggedInEvent =>
          $base.as((v, t, t2) => _IsUserLoggedInEventCopyWithImpl(v, t, t2));
}

abstract class IsUserLoggedInEventCopyWith<$R, $In extends IsUserLoggedInEvent,
    $Out> implements AuthEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  IsUserLoggedInEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsUserLoggedInEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsUserLoggedInEvent, $Out>
    implements IsUserLoggedInEventCopyWith<$R, IsUserLoggedInEvent, $Out> {
  _IsUserLoggedInEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsUserLoggedInEvent> $mapper =
      IsUserLoggedInEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  IsUserLoggedInEvent $make(CopyWithData data) => IsUserLoggedInEvent();

  @override
  IsUserLoggedInEventCopyWith<$R2, IsUserLoggedInEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IsUserLoggedInEventCopyWithImpl($value, $cast, t);
}

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
      AuthInitialMapper.ensureInitialized();
      AuthLoadingMapper.ensureInitialized();
      AuthErrorMapper.ensureInitialized();
      CreatedUserMapper.ensureInitialized();
      AdminCheckStatusMapper.ensureInitialized();
      CachedUserTokenMapper.ensureInitialized();
      CheckingIsUserLoggedInMapper.ensureInitialized();
      IsLoggedInStatusMapper.ensureInitialized();
      LoggedInCheckFailedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  @override
  final MappableFields<AuthState> fields = const {};

  static AuthState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AuthState');
  }

  @override
  final Function instantiate = _instantiate;

  static AuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthState>(map);
  }

  static AuthState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthState>(json);
  }
}

mixin AuthStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AuthStateCopyWith<AuthState, AuthState, AuthState> get copyWith;
}

abstract class AuthStateCopyWith<$R, $In extends AuthState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class AuthInitialMapper extends ClassMapperBase<AuthInitial> {
  AuthInitialMapper._();

  static AuthInitialMapper? _instance;
  static AuthInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthInitialMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthInitial';

  @override
  final MappableFields<AuthInitial> fields = const {};

  static AuthInitial _instantiate(DecodingData data) {
    return AuthInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static AuthInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthInitial>(map);
  }

  static AuthInitial fromJson(String json) {
    return ensureInitialized().decodeJson<AuthInitial>(json);
  }
}

mixin AuthInitialMappable {
  String toJson() {
    return AuthInitialMapper.ensureInitialized()
        .encodeJson<AuthInitial>(this as AuthInitial);
  }

  Map<String, dynamic> toMap() {
    return AuthInitialMapper.ensureInitialized()
        .encodeMap<AuthInitial>(this as AuthInitial);
  }

  AuthInitialCopyWith<AuthInitial, AuthInitial, AuthInitial> get copyWith =>
      _AuthInitialCopyWithImpl(this as AuthInitial, $identity, $identity);
  @override
  String toString() {
    return AuthInitialMapper.ensureInitialized()
        .stringifyValue(this as AuthInitial);
  }

  @override
  bool operator ==(Object other) {
    return AuthInitialMapper.ensureInitialized()
        .equalsValue(this as AuthInitial, other);
  }

  @override
  int get hashCode {
    return AuthInitialMapper.ensureInitialized().hashValue(this as AuthInitial);
  }
}

extension AuthInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthInitial, $Out> {
  AuthInitialCopyWith<$R, AuthInitial, $Out> get $asAuthInitial =>
      $base.as((v, t, t2) => _AuthInitialCopyWithImpl(v, t, t2));
}

abstract class AuthInitialCopyWith<$R, $In extends AuthInitial, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AuthInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthInitial, $Out>
    implements AuthInitialCopyWith<$R, AuthInitial, $Out> {
  _AuthInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthInitial> $mapper =
      AuthInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AuthInitial $make(CopyWithData data) => AuthInitial();

  @override
  AuthInitialCopyWith<$R2, AuthInitial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthInitialCopyWithImpl($value, $cast, t);
}

class AuthLoadingMapper extends ClassMapperBase<AuthLoading> {
  AuthLoadingMapper._();

  static AuthLoadingMapper? _instance;
  static AuthLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthLoadingMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthLoading';

  @override
  final MappableFields<AuthLoading> fields = const {};

  static AuthLoading _instantiate(DecodingData data) {
    return AuthLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static AuthLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthLoading>(map);
  }

  static AuthLoading fromJson(String json) {
    return ensureInitialized().decodeJson<AuthLoading>(json);
  }
}

mixin AuthLoadingMappable {
  String toJson() {
    return AuthLoadingMapper.ensureInitialized()
        .encodeJson<AuthLoading>(this as AuthLoading);
  }

  Map<String, dynamic> toMap() {
    return AuthLoadingMapper.ensureInitialized()
        .encodeMap<AuthLoading>(this as AuthLoading);
  }

  AuthLoadingCopyWith<AuthLoading, AuthLoading, AuthLoading> get copyWith =>
      _AuthLoadingCopyWithImpl(this as AuthLoading, $identity, $identity);
  @override
  String toString() {
    return AuthLoadingMapper.ensureInitialized()
        .stringifyValue(this as AuthLoading);
  }

  @override
  bool operator ==(Object other) {
    return AuthLoadingMapper.ensureInitialized()
        .equalsValue(this as AuthLoading, other);
  }

  @override
  int get hashCode {
    return AuthLoadingMapper.ensureInitialized().hashValue(this as AuthLoading);
  }
}

extension AuthLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthLoading, $Out> {
  AuthLoadingCopyWith<$R, AuthLoading, $Out> get $asAuthLoading =>
      $base.as((v, t, t2) => _AuthLoadingCopyWithImpl(v, t, t2));
}

abstract class AuthLoadingCopyWith<$R, $In extends AuthLoading, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AuthLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthLoading, $Out>
    implements AuthLoadingCopyWith<$R, AuthLoading, $Out> {
  _AuthLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthLoading> $mapper =
      AuthLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AuthLoading $make(CopyWithData data) => AuthLoading();

  @override
  AuthLoadingCopyWith<$R2, AuthLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthLoadingCopyWithImpl($value, $cast, t);
}

class AuthErrorMapper extends ClassMapperBase<AuthError> {
  AuthErrorMapper._();

  static AuthErrorMapper? _instance;
  static AuthErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthErrorMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthError';

  static String _$message(AuthError v) => v.message;
  static const Field<AuthError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<AuthError> fields = const {
    #message: _f$message,
  };

  static AuthError _instantiate(DecodingData data) {
    return AuthError(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthError>(map);
  }

  static AuthError fromJson(String json) {
    return ensureInitialized().decodeJson<AuthError>(json);
  }
}

mixin AuthErrorMappable {
  String toJson() {
    return AuthErrorMapper.ensureInitialized()
        .encodeJson<AuthError>(this as AuthError);
  }

  Map<String, dynamic> toMap() {
    return AuthErrorMapper.ensureInitialized()
        .encodeMap<AuthError>(this as AuthError);
  }

  AuthErrorCopyWith<AuthError, AuthError, AuthError> get copyWith =>
      _AuthErrorCopyWithImpl(this as AuthError, $identity, $identity);
  @override
  String toString() {
    return AuthErrorMapper.ensureInitialized()
        .stringifyValue(this as AuthError);
  }

  @override
  bool operator ==(Object other) {
    return AuthErrorMapper.ensureInitialized()
        .equalsValue(this as AuthError, other);
  }

  @override
  int get hashCode {
    return AuthErrorMapper.ensureInitialized().hashValue(this as AuthError);
  }
}

extension AuthErrorValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthError, $Out> {
  AuthErrorCopyWith<$R, AuthError, $Out> get $asAuthError =>
      $base.as((v, t, t2) => _AuthErrorCopyWithImpl(v, t, t2));
}

abstract class AuthErrorCopyWith<$R, $In extends AuthError, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  AuthErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthError, $Out>
    implements AuthErrorCopyWith<$R, AuthError, $Out> {
  _AuthErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthError> $mapper =
      AuthErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  AuthError $make(CopyWithData data) =>
      AuthError(data.get(#message, or: $value.message));

  @override
  AuthErrorCopyWith<$R2, AuthError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthErrorCopyWithImpl($value, $cast, t);
}

class CreatedUserMapper extends ClassMapperBase<CreatedUser> {
  CreatedUserMapper._();

  static CreatedUserMapper? _instance;
  static CreatedUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreatedUserMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreatedUser';

  static String _$userToken(CreatedUser v) => v.userToken;
  static const Field<CreatedUser, String> _f$userToken =
      Field('userToken', _$userToken);

  @override
  final MappableFields<CreatedUser> fields = const {
    #userToken: _f$userToken,
  };

  static CreatedUser _instantiate(DecodingData data) {
    return CreatedUser(userToken: data.dec(_f$userToken));
  }

  @override
  final Function instantiate = _instantiate;

  static CreatedUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreatedUser>(map);
  }

  static CreatedUser fromJson(String json) {
    return ensureInitialized().decodeJson<CreatedUser>(json);
  }
}

mixin CreatedUserMappable {
  String toJson() {
    return CreatedUserMapper.ensureInitialized()
        .encodeJson<CreatedUser>(this as CreatedUser);
  }

  Map<String, dynamic> toMap() {
    return CreatedUserMapper.ensureInitialized()
        .encodeMap<CreatedUser>(this as CreatedUser);
  }

  CreatedUserCopyWith<CreatedUser, CreatedUser, CreatedUser> get copyWith =>
      _CreatedUserCopyWithImpl(this as CreatedUser, $identity, $identity);
  @override
  String toString() {
    return CreatedUserMapper.ensureInitialized()
        .stringifyValue(this as CreatedUser);
  }

  @override
  bool operator ==(Object other) {
    return CreatedUserMapper.ensureInitialized()
        .equalsValue(this as CreatedUser, other);
  }

  @override
  int get hashCode {
    return CreatedUserMapper.ensureInitialized().hashValue(this as CreatedUser);
  }
}

extension CreatedUserValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreatedUser, $Out> {
  CreatedUserCopyWith<$R, CreatedUser, $Out> get $asCreatedUser =>
      $base.as((v, t, t2) => _CreatedUserCopyWithImpl(v, t, t2));
}

abstract class CreatedUserCopyWith<$R, $In extends CreatedUser, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken});
  CreatedUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CreatedUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreatedUser, $Out>
    implements CreatedUserCopyWith<$R, CreatedUser, $Out> {
  _CreatedUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreatedUser> $mapper =
      CreatedUserMapper.ensureInitialized();
  @override
  $R call({String? userToken}) =>
      $apply(FieldCopyWithData({if (userToken != null) #userToken: userToken}));
  @override
  CreatedUser $make(CopyWithData data) =>
      CreatedUser(userToken: data.get(#userToken, or: $value.userToken));

  @override
  CreatedUserCopyWith<$R2, CreatedUser, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreatedUserCopyWithImpl($value, $cast, t);
}

class AdminCheckStatusMapper extends ClassMapperBase<AdminCheckStatus> {
  AdminCheckStatusMapper._();

  static AdminCheckStatusMapper? _instance;
  static AdminCheckStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminCheckStatusMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdminCheckStatus';

  static bool _$isAdmin(AdminCheckStatus v) => v.isAdmin;
  static const Field<AdminCheckStatus, bool> _f$isAdmin =
      Field('isAdmin', _$isAdmin);

  @override
  final MappableFields<AdminCheckStatus> fields = const {
    #isAdmin: _f$isAdmin,
  };

  static AdminCheckStatus _instantiate(DecodingData data) {
    return AdminCheckStatus(isAdmin: data.dec(_f$isAdmin));
  }

  @override
  final Function instantiate = _instantiate;

  static AdminCheckStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdminCheckStatus>(map);
  }

  static AdminCheckStatus fromJson(String json) {
    return ensureInitialized().decodeJson<AdminCheckStatus>(json);
  }
}

mixin AdminCheckStatusMappable {
  String toJson() {
    return AdminCheckStatusMapper.ensureInitialized()
        .encodeJson<AdminCheckStatus>(this as AdminCheckStatus);
  }

  Map<String, dynamic> toMap() {
    return AdminCheckStatusMapper.ensureInitialized()
        .encodeMap<AdminCheckStatus>(this as AdminCheckStatus);
  }

  AdminCheckStatusCopyWith<AdminCheckStatus, AdminCheckStatus, AdminCheckStatus>
      get copyWith => _AdminCheckStatusCopyWithImpl(
          this as AdminCheckStatus, $identity, $identity);
  @override
  String toString() {
    return AdminCheckStatusMapper.ensureInitialized()
        .stringifyValue(this as AdminCheckStatus);
  }

  @override
  bool operator ==(Object other) {
    return AdminCheckStatusMapper.ensureInitialized()
        .equalsValue(this as AdminCheckStatus, other);
  }

  @override
  int get hashCode {
    return AdminCheckStatusMapper.ensureInitialized()
        .hashValue(this as AdminCheckStatus);
  }
}

extension AdminCheckStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdminCheckStatus, $Out> {
  AdminCheckStatusCopyWith<$R, AdminCheckStatus, $Out>
      get $asAdminCheckStatus =>
          $base.as((v, t, t2) => _AdminCheckStatusCopyWithImpl(v, t, t2));
}

abstract class AdminCheckStatusCopyWith<$R, $In extends AdminCheckStatus, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? isAdmin});
  AdminCheckStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdminCheckStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdminCheckStatus, $Out>
    implements AdminCheckStatusCopyWith<$R, AdminCheckStatus, $Out> {
  _AdminCheckStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdminCheckStatus> $mapper =
      AdminCheckStatusMapper.ensureInitialized();
  @override
  $R call({bool? isAdmin}) =>
      $apply(FieldCopyWithData({if (isAdmin != null) #isAdmin: isAdmin}));
  @override
  AdminCheckStatus $make(CopyWithData data) =>
      AdminCheckStatus(isAdmin: data.get(#isAdmin, or: $value.isAdmin));

  @override
  AdminCheckStatusCopyWith<$R2, AdminCheckStatus, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdminCheckStatusCopyWithImpl($value, $cast, t);
}

class CachedUserTokenMapper extends ClassMapperBase<CachedUserToken> {
  CachedUserTokenMapper._();

  static CachedUserTokenMapper? _instance;
  static CachedUserTokenMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CachedUserTokenMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CachedUserToken';

  @override
  final MappableFields<CachedUserToken> fields = const {};

  static CachedUserToken _instantiate(DecodingData data) {
    return CachedUserToken();
  }

  @override
  final Function instantiate = _instantiate;

  static CachedUserToken fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CachedUserToken>(map);
  }

  static CachedUserToken fromJson(String json) {
    return ensureInitialized().decodeJson<CachedUserToken>(json);
  }
}

mixin CachedUserTokenMappable {
  String toJson() {
    return CachedUserTokenMapper.ensureInitialized()
        .encodeJson<CachedUserToken>(this as CachedUserToken);
  }

  Map<String, dynamic> toMap() {
    return CachedUserTokenMapper.ensureInitialized()
        .encodeMap<CachedUserToken>(this as CachedUserToken);
  }

  CachedUserTokenCopyWith<CachedUserToken, CachedUserToken, CachedUserToken>
      get copyWith => _CachedUserTokenCopyWithImpl(
          this as CachedUserToken, $identity, $identity);
  @override
  String toString() {
    return CachedUserTokenMapper.ensureInitialized()
        .stringifyValue(this as CachedUserToken);
  }

  @override
  bool operator ==(Object other) {
    return CachedUserTokenMapper.ensureInitialized()
        .equalsValue(this as CachedUserToken, other);
  }

  @override
  int get hashCode {
    return CachedUserTokenMapper.ensureInitialized()
        .hashValue(this as CachedUserToken);
  }
}

extension CachedUserTokenValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CachedUserToken, $Out> {
  CachedUserTokenCopyWith<$R, CachedUserToken, $Out> get $asCachedUserToken =>
      $base.as((v, t, t2) => _CachedUserTokenCopyWithImpl(v, t, t2));
}

abstract class CachedUserTokenCopyWith<$R, $In extends CachedUserToken, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  CachedUserTokenCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CachedUserTokenCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CachedUserToken, $Out>
    implements CachedUserTokenCopyWith<$R, CachedUserToken, $Out> {
  _CachedUserTokenCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CachedUserToken> $mapper =
      CachedUserTokenMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  CachedUserToken $make(CopyWithData data) => CachedUserToken();

  @override
  CachedUserTokenCopyWith<$R2, CachedUserToken, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CachedUserTokenCopyWithImpl($value, $cast, t);
}

class CheckingIsUserLoggedInMapper
    extends ClassMapperBase<CheckingIsUserLoggedIn> {
  CheckingIsUserLoggedInMapper._();

  static CheckingIsUserLoggedInMapper? _instance;
  static CheckingIsUserLoggedInMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CheckingIsUserLoggedInMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CheckingIsUserLoggedIn';

  @override
  final MappableFields<CheckingIsUserLoggedIn> fields = const {};

  static CheckingIsUserLoggedIn _instantiate(DecodingData data) {
    return CheckingIsUserLoggedIn();
  }

  @override
  final Function instantiate = _instantiate;

  static CheckingIsUserLoggedIn fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckingIsUserLoggedIn>(map);
  }

  static CheckingIsUserLoggedIn fromJson(String json) {
    return ensureInitialized().decodeJson<CheckingIsUserLoggedIn>(json);
  }
}

mixin CheckingIsUserLoggedInMappable {
  String toJson() {
    return CheckingIsUserLoggedInMapper.ensureInitialized()
        .encodeJson<CheckingIsUserLoggedIn>(this as CheckingIsUserLoggedIn);
  }

  Map<String, dynamic> toMap() {
    return CheckingIsUserLoggedInMapper.ensureInitialized()
        .encodeMap<CheckingIsUserLoggedIn>(this as CheckingIsUserLoggedIn);
  }

  CheckingIsUserLoggedInCopyWith<CheckingIsUserLoggedIn, CheckingIsUserLoggedIn,
          CheckingIsUserLoggedIn>
      get copyWith => _CheckingIsUserLoggedInCopyWithImpl(
          this as CheckingIsUserLoggedIn, $identity, $identity);
  @override
  String toString() {
    return CheckingIsUserLoggedInMapper.ensureInitialized()
        .stringifyValue(this as CheckingIsUserLoggedIn);
  }

  @override
  bool operator ==(Object other) {
    return CheckingIsUserLoggedInMapper.ensureInitialized()
        .equalsValue(this as CheckingIsUserLoggedIn, other);
  }

  @override
  int get hashCode {
    return CheckingIsUserLoggedInMapper.ensureInitialized()
        .hashValue(this as CheckingIsUserLoggedIn);
  }
}

extension CheckingIsUserLoggedInValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckingIsUserLoggedIn, $Out> {
  CheckingIsUserLoggedInCopyWith<$R, CheckingIsUserLoggedIn, $Out>
      get $asCheckingIsUserLoggedIn =>
          $base.as((v, t, t2) => _CheckingIsUserLoggedInCopyWithImpl(v, t, t2));
}

abstract class CheckingIsUserLoggedInCopyWith<
    $R,
    $In extends CheckingIsUserLoggedIn,
    $Out> implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  CheckingIsUserLoggedInCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckingIsUserLoggedInCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckingIsUserLoggedIn, $Out>
    implements
        CheckingIsUserLoggedInCopyWith<$R, CheckingIsUserLoggedIn, $Out> {
  _CheckingIsUserLoggedInCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckingIsUserLoggedIn> $mapper =
      CheckingIsUserLoggedInMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  CheckingIsUserLoggedIn $make(CopyWithData data) => CheckingIsUserLoggedIn();

  @override
  CheckingIsUserLoggedInCopyWith<$R2, CheckingIsUserLoggedIn, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckingIsUserLoggedInCopyWithImpl($value, $cast, t);
}

class IsLoggedInStatusMapper extends ClassMapperBase<IsLoggedInStatus> {
  IsLoggedInStatusMapper._();

  static IsLoggedInStatusMapper? _instance;
  static IsLoggedInStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsLoggedInStatusMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsLoggedInStatus';

  static String _$loggedInUserToken(IsLoggedInStatus v) => v.loggedInUserToken;
  static const Field<IsLoggedInStatus, String> _f$loggedInUserToken =
      Field('loggedInUserToken', _$loggedInUserToken);

  @override
  final MappableFields<IsLoggedInStatus> fields = const {
    #loggedInUserToken: _f$loggedInUserToken,
  };

  static IsLoggedInStatus _instantiate(DecodingData data) {
    return IsLoggedInStatus(loggedInUserToken: data.dec(_f$loggedInUserToken));
  }

  @override
  final Function instantiate = _instantiate;

  static IsLoggedInStatus fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsLoggedInStatus>(map);
  }

  static IsLoggedInStatus fromJson(String json) {
    return ensureInitialized().decodeJson<IsLoggedInStatus>(json);
  }
}

mixin IsLoggedInStatusMappable {
  String toJson() {
    return IsLoggedInStatusMapper.ensureInitialized()
        .encodeJson<IsLoggedInStatus>(this as IsLoggedInStatus);
  }

  Map<String, dynamic> toMap() {
    return IsLoggedInStatusMapper.ensureInitialized()
        .encodeMap<IsLoggedInStatus>(this as IsLoggedInStatus);
  }

  IsLoggedInStatusCopyWith<IsLoggedInStatus, IsLoggedInStatus, IsLoggedInStatus>
      get copyWith => _IsLoggedInStatusCopyWithImpl(
          this as IsLoggedInStatus, $identity, $identity);
  @override
  String toString() {
    return IsLoggedInStatusMapper.ensureInitialized()
        .stringifyValue(this as IsLoggedInStatus);
  }

  @override
  bool operator ==(Object other) {
    return IsLoggedInStatusMapper.ensureInitialized()
        .equalsValue(this as IsLoggedInStatus, other);
  }

  @override
  int get hashCode {
    return IsLoggedInStatusMapper.ensureInitialized()
        .hashValue(this as IsLoggedInStatus);
  }
}

extension IsLoggedInStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsLoggedInStatus, $Out> {
  IsLoggedInStatusCopyWith<$R, IsLoggedInStatus, $Out>
      get $asIsLoggedInStatus =>
          $base.as((v, t, t2) => _IsLoggedInStatusCopyWithImpl(v, t, t2));
}

abstract class IsLoggedInStatusCopyWith<$R, $In extends IsLoggedInStatus, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? loggedInUserToken});
  IsLoggedInStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsLoggedInStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsLoggedInStatus, $Out>
    implements IsLoggedInStatusCopyWith<$R, IsLoggedInStatus, $Out> {
  _IsLoggedInStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsLoggedInStatus> $mapper =
      IsLoggedInStatusMapper.ensureInitialized();
  @override
  $R call({String? loggedInUserToken}) => $apply(FieldCopyWithData(
      {if (loggedInUserToken != null) #loggedInUserToken: loggedInUserToken}));
  @override
  IsLoggedInStatus $make(CopyWithData data) => IsLoggedInStatus(
      loggedInUserToken:
          data.get(#loggedInUserToken, or: $value.loggedInUserToken));

  @override
  IsLoggedInStatusCopyWith<$R2, IsLoggedInStatus, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsLoggedInStatusCopyWithImpl($value, $cast, t);
}

class LoggedInCheckFailedMapper extends ClassMapperBase<LoggedInCheckFailed> {
  LoggedInCheckFailedMapper._();

  static LoggedInCheckFailedMapper? _instance;
  static LoggedInCheckFailedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoggedInCheckFailedMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoggedInCheckFailed';

  @override
  final MappableFields<LoggedInCheckFailed> fields = const {};

  static LoggedInCheckFailed _instantiate(DecodingData data) {
    return LoggedInCheckFailed();
  }

  @override
  final Function instantiate = _instantiate;

  static LoggedInCheckFailed fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoggedInCheckFailed>(map);
  }

  static LoggedInCheckFailed fromJson(String json) {
    return ensureInitialized().decodeJson<LoggedInCheckFailed>(json);
  }
}

mixin LoggedInCheckFailedMappable {
  String toJson() {
    return LoggedInCheckFailedMapper.ensureInitialized()
        .encodeJson<LoggedInCheckFailed>(this as LoggedInCheckFailed);
  }

  Map<String, dynamic> toMap() {
    return LoggedInCheckFailedMapper.ensureInitialized()
        .encodeMap<LoggedInCheckFailed>(this as LoggedInCheckFailed);
  }

  LoggedInCheckFailedCopyWith<LoggedInCheckFailed, LoggedInCheckFailed,
          LoggedInCheckFailed>
      get copyWith => _LoggedInCheckFailedCopyWithImpl(
          this as LoggedInCheckFailed, $identity, $identity);
  @override
  String toString() {
    return LoggedInCheckFailedMapper.ensureInitialized()
        .stringifyValue(this as LoggedInCheckFailed);
  }

  @override
  bool operator ==(Object other) {
    return LoggedInCheckFailedMapper.ensureInitialized()
        .equalsValue(this as LoggedInCheckFailed, other);
  }

  @override
  int get hashCode {
    return LoggedInCheckFailedMapper.ensureInitialized()
        .hashValue(this as LoggedInCheckFailed);
  }
}

extension LoggedInCheckFailedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoggedInCheckFailed, $Out> {
  LoggedInCheckFailedCopyWith<$R, LoggedInCheckFailed, $Out>
      get $asLoggedInCheckFailed =>
          $base.as((v, t, t2) => _LoggedInCheckFailedCopyWithImpl(v, t, t2));
}

abstract class LoggedInCheckFailedCopyWith<$R, $In extends LoggedInCheckFailed,
    $Out> implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoggedInCheckFailedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoggedInCheckFailedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoggedInCheckFailed, $Out>
    implements LoggedInCheckFailedCopyWith<$R, LoggedInCheckFailed, $Out> {
  _LoggedInCheckFailedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoggedInCheckFailed> $mapper =
      LoggedInCheckFailedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoggedInCheckFailed $make(CopyWithData data) => LoggedInCheckFailed();

  @override
  LoggedInCheckFailedCopyWith<$R2, LoggedInCheckFailed, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LoggedInCheckFailedCopyWithImpl($value, $cast, t);
}
