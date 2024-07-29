// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_response_model.dart';

class NotificationResponseModelMapper
    extends SubClassMapperBase<NotificationResponseModel> {
  NotificationResponseModelMapper._();

  static NotificationResponseModelMapper? _instance;
  static NotificationResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = NotificationResponseModelMapper._());
      NotificationResponseMapper.ensureInitialized().addSubMapper(_instance!);
      NotificationErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationResponseModel';

  static String _$message(NotificationResponseModel v) => v.message;
  static const Field<NotificationResponseModel, String> _f$message =
      Field('message', _$message);
  static int _$success(NotificationResponseModel v) => v.success;
  static const Field<NotificationResponseModel, int> _f$success =
      Field('success', _$success);
  static int _$failure(NotificationResponseModel v) => v.failure;
  static const Field<NotificationResponseModel, int> _f$failure =
      Field('failure', _$failure);
  static List<NotificationError> _$errors(NotificationResponseModel v) =>
      v.errors;
  static const Field<NotificationResponseModel, List<NotificationError>>
      _f$errors = Field('errors', _$errors);

  @override
  final MappableFields<NotificationResponseModel> fields = const {
    #message: _f$message,
    #success: _f$success,
    #failure: _f$failure,
    #errors: _f$errors,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'notificationResponseModel';
  @override
  late final ClassMapperBase superMapper =
      NotificationResponseMapper.ensureInitialized();

  static NotificationResponseModel _instantiate(DecodingData data) {
    return NotificationResponseModel(
        message: data.dec(_f$message),
        success: data.dec(_f$success),
        failure: data.dec(_f$failure),
        errors: data.dec(_f$errors));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationResponseModel>(map);
  }

  static NotificationResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationResponseModel>(json);
  }
}

mixin NotificationResponseModelMappable {
  String toJson() {
    return NotificationResponseModelMapper.ensureInitialized()
        .encodeJson<NotificationResponseModel>(
            this as NotificationResponseModel);
  }

  Map<String, dynamic> toMap() {
    return NotificationResponseModelMapper.ensureInitialized()
        .encodeMap<NotificationResponseModel>(
            this as NotificationResponseModel);
  }

  NotificationResponseModelCopyWith<NotificationResponseModel,
          NotificationResponseModel, NotificationResponseModel>
      get copyWith => _NotificationResponseModelCopyWithImpl(
          this as NotificationResponseModel, $identity, $identity);
  @override
  String toString() {
    return NotificationResponseModelMapper.ensureInitialized()
        .stringifyValue(this as NotificationResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return NotificationResponseModelMapper.ensureInitialized()
        .equalsValue(this as NotificationResponseModel, other);
  }

  @override
  int get hashCode {
    return NotificationResponseModelMapper.ensureInitialized()
        .hashValue(this as NotificationResponseModel);
  }
}

extension NotificationResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationResponseModel, $Out> {
  NotificationResponseModelCopyWith<$R, NotificationResponseModel, $Out>
      get $asNotificationResponseModel => $base
          .as((v, t, t2) => _NotificationResponseModelCopyWithImpl(v, t, t2));
}

abstract class NotificationResponseModelCopyWith<
    $R,
    $In extends NotificationResponseModel,
    $Out> implements NotificationResponseCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, NotificationError,
          NotificationErrorCopyWith<$R, NotificationError, NotificationError>>
      get errors;
  @override
  $R call(
      {String? message,
      int? success,
      int? failure,
      List<NotificationError>? errors});
  NotificationResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationResponseModel, $Out>
    implements
        NotificationResponseModelCopyWith<$R, NotificationResponseModel, $Out> {
  _NotificationResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationResponseModel> $mapper =
      NotificationResponseModelMapper.ensureInitialized();
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
  NotificationResponseModel $make(CopyWithData data) =>
      NotificationResponseModel(
          message: data.get(#message, or: $value.message),
          success: data.get(#success, or: $value.success),
          failure: data.get(#failure, or: $value.failure),
          errors: data.get(#errors, or: $value.errors));

  @override
  NotificationResponseModelCopyWith<$R2, NotificationResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationResponseModelCopyWithImpl($value, $cast, t);
}
