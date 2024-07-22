// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'send_notifications.dart';

class SendNotificationsParamsMapper
    extends ClassMapperBase<SendNotificationsParams> {
  SendNotificationsParamsMapper._();

  static SendNotificationsParamsMapper? _instance;
  static SendNotificationsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SendNotificationsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SendNotificationsParams';

  static String _$userToken(SendNotificationsParams v) => v.userToken;
  static const Field<SendNotificationsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$title(SendNotificationsParams v) => v.title;
  static const Field<SendNotificationsParams, String> _f$title =
      Field('title', _$title);
  static String _$body(SendNotificationsParams v) => v.body;
  static const Field<SendNotificationsParams, String> _f$body =
      Field('body', _$body);
  static String _$fileName(SendNotificationsParams v) => v.fileName;
  static const Field<SendNotificationsParams, String> _f$fileName =
      Field('fileName', _$fileName);

  @override
  final MappableFields<SendNotificationsParams> fields = const {
    #userToken: _f$userToken,
    #title: _f$title,
    #body: _f$body,
    #fileName: _f$fileName,
  };

  static SendNotificationsParams _instantiate(DecodingData data) {
    return SendNotificationsParams(
        userToken: data.dec(_f$userToken),
        title: data.dec(_f$title),
        body: data.dec(_f$body),
        fileName: data.dec(_f$fileName));
  }

  @override
  final Function instantiate = _instantiate;

  static SendNotificationsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendNotificationsParams>(map);
  }

  static SendNotificationsParams fromJson(String json) {
    return ensureInitialized().decodeJson<SendNotificationsParams>(json);
  }
}

mixin SendNotificationsParamsMappable {
  String toJson() {
    return SendNotificationsParamsMapper.ensureInitialized()
        .encodeJson<SendNotificationsParams>(this as SendNotificationsParams);
  }

  Map<String, dynamic> toMap() {
    return SendNotificationsParamsMapper.ensureInitialized()
        .encodeMap<SendNotificationsParams>(this as SendNotificationsParams);
  }

  SendNotificationsParamsCopyWith<SendNotificationsParams,
          SendNotificationsParams, SendNotificationsParams>
      get copyWith => _SendNotificationsParamsCopyWithImpl(
          this as SendNotificationsParams, $identity, $identity);
  @override
  String toString() {
    return SendNotificationsParamsMapper.ensureInitialized()
        .stringifyValue(this as SendNotificationsParams);
  }

  @override
  bool operator ==(Object other) {
    return SendNotificationsParamsMapper.ensureInitialized()
        .equalsValue(this as SendNotificationsParams, other);
  }

  @override
  int get hashCode {
    return SendNotificationsParamsMapper.ensureInitialized()
        .hashValue(this as SendNotificationsParams);
  }
}

extension SendNotificationsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendNotificationsParams, $Out> {
  SendNotificationsParamsCopyWith<$R, SendNotificationsParams, $Out>
      get $asSendNotificationsParams => $base
          .as((v, t, t2) => _SendNotificationsParamsCopyWithImpl(v, t, t2));
}

abstract class SendNotificationsParamsCopyWith<
    $R,
    $In extends SendNotificationsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? title, String? body, String? fileName});
  SendNotificationsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SendNotificationsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendNotificationsParams, $Out>
    implements
        SendNotificationsParamsCopyWith<$R, SendNotificationsParams, $Out> {
  _SendNotificationsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendNotificationsParams> $mapper =
      SendNotificationsParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? title, String? body, String? fileName}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (title != null) #title: title,
        if (body != null) #body: body,
        if (fileName != null) #fileName: fileName
      }));
  @override
  SendNotificationsParams $make(CopyWithData data) => SendNotificationsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      title: data.get(#title, or: $value.title),
      body: data.get(#body, or: $value.body),
      fileName: data.get(#fileName, or: $value.fileName));

  @override
  SendNotificationsParamsCopyWith<$R2, SendNotificationsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SendNotificationsParamsCopyWithImpl($value, $cast, t);
}
