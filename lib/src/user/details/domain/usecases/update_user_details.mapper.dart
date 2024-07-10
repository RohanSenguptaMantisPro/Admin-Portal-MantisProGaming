// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_user_details.dart';

class UpdateUserDetailsParamsMapper
    extends ClassMapperBase<UpdateUserDetailsParams> {
  UpdateUserDetailsParamsMapper._();

  static UpdateUserDetailsParamsMapper? _instance;
  static UpdateUserDetailsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UpdateUserDetailsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserDetailsParams';

  static String _$userToken(UpdateUserDetailsParams v) => v.userToken;
  static const Field<UpdateUserDetailsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$userID(UpdateUserDetailsParams v) => v.userID;
  static const Field<UpdateUserDetailsParams, String> _f$userID =
      Field('userID', _$userID);
  static String _$accountStatus(UpdateUserDetailsParams v) => v.accountStatus;
  static const Field<UpdateUserDetailsParams, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus);

  @override
  final MappableFields<UpdateUserDetailsParams> fields = const {
    #userToken: _f$userToken,
    #userID: _f$userID,
    #accountStatus: _f$accountStatus,
  };

  static UpdateUserDetailsParams _instantiate(DecodingData data) {
    return UpdateUserDetailsParams(
        userToken: data.dec(_f$userToken),
        userID: data.dec(_f$userID),
        accountStatus: data.dec(_f$accountStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserDetailsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserDetailsParams>(map);
  }

  static UpdateUserDetailsParams fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUserDetailsParams>(json);
  }
}

mixin UpdateUserDetailsParamsMappable {
  String toJson() {
    return UpdateUserDetailsParamsMapper.ensureInitialized()
        .encodeJson<UpdateUserDetailsParams>(this as UpdateUserDetailsParams);
  }

  Map<String, dynamic> toMap() {
    return UpdateUserDetailsParamsMapper.ensureInitialized()
        .encodeMap<UpdateUserDetailsParams>(this as UpdateUserDetailsParams);
  }

  UpdateUserDetailsParamsCopyWith<UpdateUserDetailsParams,
          UpdateUserDetailsParams, UpdateUserDetailsParams>
      get copyWith => _UpdateUserDetailsParamsCopyWithImpl(
          this as UpdateUserDetailsParams, $identity, $identity);
  @override
  String toString() {
    return UpdateUserDetailsParamsMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserDetailsParams);
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserDetailsParamsMapper.ensureInitialized()
        .equalsValue(this as UpdateUserDetailsParams, other);
  }

  @override
  int get hashCode {
    return UpdateUserDetailsParamsMapper.ensureInitialized()
        .hashValue(this as UpdateUserDetailsParams);
  }
}

extension UpdateUserDetailsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserDetailsParams, $Out> {
  UpdateUserDetailsParamsCopyWith<$R, UpdateUserDetailsParams, $Out>
      get $asUpdateUserDetailsParams => $base
          .as((v, t, t2) => _UpdateUserDetailsParamsCopyWithImpl(v, t, t2));
}

abstract class UpdateUserDetailsParamsCopyWith<
    $R,
    $In extends UpdateUserDetailsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? userID, String? accountStatus});
  UpdateUserDetailsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserDetailsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserDetailsParams, $Out>
    implements
        UpdateUserDetailsParamsCopyWith<$R, UpdateUserDetailsParams, $Out> {
  _UpdateUserDetailsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserDetailsParams> $mapper =
      UpdateUserDetailsParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? userID, String? accountStatus}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (userID != null) #userID: userID,
        if (accountStatus != null) #accountStatus: accountStatus
      }));
  @override
  UpdateUserDetailsParams $make(CopyWithData data) => UpdateUserDetailsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      userID: data.get(#userID, or: $value.userID),
      accountStatus: data.get(#accountStatus, or: $value.accountStatus));

  @override
  UpdateUserDetailsParamsCopyWith<$R2, UpdateUserDetailsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserDetailsParamsCopyWithImpl($value, $cast, t);
}
