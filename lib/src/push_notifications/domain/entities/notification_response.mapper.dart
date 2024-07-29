// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_response.dart';

class NotificationResponseMapper extends ClassMapperBase<NotificationResponse> {
  NotificationResponseMapper._();

  static NotificationResponseMapper? _instance;
  static NotificationResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationResponseMapper._());
      NotificationErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationResponse';

  static String _$message(NotificationResponse v) => v.message;
  static const Field<NotificationResponse, String> _f$message =
      Field('message', _$message);
  static int _$success(NotificationResponse v) => v.success;
  static const Field<NotificationResponse, int> _f$success =
      Field('success', _$success);
  static int _$failure(NotificationResponse v) => v.failure;
  static const Field<NotificationResponse, int> _f$failure =
      Field('failure', _$failure);
  static List<NotificationError> _$errors(NotificationResponse v) => v.errors;
  static const Field<NotificationResponse, List<NotificationError>> _f$errors =
      Field('errors', _$errors);

  @override
  final MappableFields<NotificationResponse> fields = const {
    #message: _f$message,
    #success: _f$success,
    #failure: _f$failure,
    #errors: _f$errors,
  };

  static NotificationResponse _instantiate(DecodingData data) {
    return NotificationResponse(
        message: data.dec(_f$message),
        success: data.dec(_f$success),
        failure: data.dec(_f$failure),
        errors: data.dec(_f$errors));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationResponse>(map);
  }

  static NotificationResponse fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationResponse>(json);
  }
}

mixin NotificationResponseMappable {
  String toJson() {
    return NotificationResponseMapper.ensureInitialized()
        .encodeJson<NotificationResponse>(this as NotificationResponse);
  }

  Map<String, dynamic> toMap() {
    return NotificationResponseMapper.ensureInitialized()
        .encodeMap<NotificationResponse>(this as NotificationResponse);
  }

  NotificationResponseCopyWith<NotificationResponse, NotificationResponse,
          NotificationResponse>
      get copyWith => _NotificationResponseCopyWithImpl(
          this as NotificationResponse, $identity, $identity);
  @override
  String toString() {
    return NotificationResponseMapper.ensureInitialized()
        .stringifyValue(this as NotificationResponse);
  }

  @override
  bool operator ==(Object other) {
    return NotificationResponseMapper.ensureInitialized()
        .equalsValue(this as NotificationResponse, other);
  }

  @override
  int get hashCode {
    return NotificationResponseMapper.ensureInitialized()
        .hashValue(this as NotificationResponse);
  }
}

extension NotificationResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationResponse, $Out> {
  NotificationResponseCopyWith<$R, NotificationResponse, $Out>
      get $asNotificationResponse =>
          $base.as((v, t, t2) => _NotificationResponseCopyWithImpl(v, t, t2));
}

abstract class NotificationResponseCopyWith<
    $R,
    $In extends NotificationResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NotificationError,
          NotificationErrorCopyWith<$R, NotificationError, NotificationError>>
      get errors;
  $R call(
      {String? message,
      int? success,
      int? failure,
      List<NotificationError>? errors});
  NotificationResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationResponse, $Out>
    implements NotificationResponseCopyWith<$R, NotificationResponse, $Out> {
  _NotificationResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationResponse> $mapper =
      NotificationResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, NotificationError,
          NotificationErrorCopyWith<$R, NotificationError, NotificationError>>
      get errors => ListCopyWith($value.errors, (v, t) => v.copyWith.$chain(t),
          (v) => call(errors: v));
  @override
  $R call(
          {String? message,
          int? success,
          int? failure,
          List<NotificationError>? errors}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (success != null) #success: success,
        if (failure != null) #failure: failure,
        if (errors != null) #errors: errors
      }));
  @override
  NotificationResponse $make(CopyWithData data) => NotificationResponse(
      message: data.get(#message, or: $value.message),
      success: data.get(#success, or: $value.success),
      failure: data.get(#failure, or: $value.failure),
      errors: data.get(#errors, or: $value.errors));

  @override
  NotificationResponseCopyWith<$R2, NotificationResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationResponseCopyWithImpl($value, $cast, t);
}

class NotificationErrorMapper extends ClassMapperBase<NotificationError> {
  NotificationErrorMapper._();

  static NotificationErrorMapper? _instance;
  static NotificationErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationErrorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationError';

  static String _$token(NotificationError v) => v.token;
  static const Field<NotificationError, String> _f$token =
      Field('token', _$token);
  static String _$error(NotificationError v) => v.error;
  static const Field<NotificationError, String> _f$error =
      Field('error', _$error);

  @override
  final MappableFields<NotificationError> fields = const {
    #token: _f$token,
    #error: _f$error,
  };

  static NotificationError _instantiate(DecodingData data) {
    return NotificationError(
        token: data.dec(_f$token), error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationError>(map);
  }

  static NotificationError fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationError>(json);
  }
}

mixin NotificationErrorMappable {
  String toJson() {
    return NotificationErrorMapper.ensureInitialized()
        .encodeJson<NotificationError>(this as NotificationError);
  }

  Map<String, dynamic> toMap() {
    return NotificationErrorMapper.ensureInitialized()
        .encodeMap<NotificationError>(this as NotificationError);
  }

  NotificationErrorCopyWith<NotificationError, NotificationError,
          NotificationError>
      get copyWith => _NotificationErrorCopyWithImpl(
          this as NotificationError, $identity, $identity);
  @override
  String toString() {
    return NotificationErrorMapper.ensureInitialized()
        .stringifyValue(this as NotificationError);
  }

  @override
  bool operator ==(Object other) {
    return NotificationErrorMapper.ensureInitialized()
        .equalsValue(this as NotificationError, other);
  }

  @override
  int get hashCode {
    return NotificationErrorMapper.ensureInitialized()
        .hashValue(this as NotificationError);
  }
}

extension NotificationErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationError, $Out> {
  NotificationErrorCopyWith<$R, NotificationError, $Out>
      get $asNotificationError =>
          $base.as((v, t, t2) => _NotificationErrorCopyWithImpl(v, t, t2));
}

abstract class NotificationErrorCopyWith<$R, $In extends NotificationError,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token, String? error});
  NotificationErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationError, $Out>
    implements NotificationErrorCopyWith<$R, NotificationError, $Out> {
  _NotificationErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationError> $mapper =
      NotificationErrorMapper.ensureInitialized();
  @override
  $R call({String? token, String? error}) => $apply(FieldCopyWithData(
      {if (token != null) #token: token, if (error != null) #error: error}));
  @override
  NotificationError $make(CopyWithData data) => NotificationError(
      token: data.get(#token, or: $value.token),
      error: data.get(#error, or: $value.error));

  @override
  NotificationErrorCopyWith<$R2, NotificationError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NotificationErrorCopyWithImpl($value, $cast, t);
}
