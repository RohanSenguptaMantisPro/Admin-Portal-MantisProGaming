// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_user_details.dart';

class GetUserDetailsParamsMapper extends ClassMapperBase<GetUserDetailsParams> {
  GetUserDetailsParamsMapper._();

  static GetUserDetailsParamsMapper? _instance;
  static GetUserDetailsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetUserDetailsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetUserDetailsParams';

  static String _$userToken(GetUserDetailsParams v) => v.userToken;
  static const Field<GetUserDetailsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$userID(GetUserDetailsParams v) => v.userID;
  static const Field<GetUserDetailsParams, String> _f$userID =
      Field('userID', _$userID);

  @override
  final MappableFields<GetUserDetailsParams> fields = const {
    #userToken: _f$userToken,
    #userID: _f$userID,
  };

  static GetUserDetailsParams _instantiate(DecodingData data) {
    return GetUserDetailsParams(
        userToken: data.dec(_f$userToken), userID: data.dec(_f$userID));
  }

  @override
  final Function instantiate = _instantiate;

  static GetUserDetailsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetUserDetailsParams>(map);
  }

  static GetUserDetailsParams fromJson(String json) {
    return ensureInitialized().decodeJson<GetUserDetailsParams>(json);
  }
}

mixin GetUserDetailsParamsMappable {
  String toJson() {
    return GetUserDetailsParamsMapper.ensureInitialized()
        .encodeJson<GetUserDetailsParams>(this as GetUserDetailsParams);
  }

  Map<String, dynamic> toMap() {
    return GetUserDetailsParamsMapper.ensureInitialized()
        .encodeMap<GetUserDetailsParams>(this as GetUserDetailsParams);
  }

  GetUserDetailsParamsCopyWith<GetUserDetailsParams, GetUserDetailsParams,
          GetUserDetailsParams>
      get copyWith => _GetUserDetailsParamsCopyWithImpl(
          this as GetUserDetailsParams, $identity, $identity);
  @override
  String toString() {
    return GetUserDetailsParamsMapper.ensureInitialized()
        .stringifyValue(this as GetUserDetailsParams);
  }

  @override
  bool operator ==(Object other) {
    return GetUserDetailsParamsMapper.ensureInitialized()
        .equalsValue(this as GetUserDetailsParams, other);
  }

  @override
  int get hashCode {
    return GetUserDetailsParamsMapper.ensureInitialized()
        .hashValue(this as GetUserDetailsParams);
  }
}

extension GetUserDetailsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetUserDetailsParams, $Out> {
  GetUserDetailsParamsCopyWith<$R, GetUserDetailsParams, $Out>
      get $asGetUserDetailsParams =>
          $base.as((v, t, t2) => _GetUserDetailsParamsCopyWithImpl(v, t, t2));
}

abstract class GetUserDetailsParamsCopyWith<
    $R,
    $In extends GetUserDetailsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? userID});
  GetUserDetailsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetUserDetailsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetUserDetailsParams, $Out>
    implements GetUserDetailsParamsCopyWith<$R, GetUserDetailsParams, $Out> {
  _GetUserDetailsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetUserDetailsParams> $mapper =
      GetUserDetailsParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? userID}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (userID != null) #userID: userID
      }));
  @override
  GetUserDetailsParams $make(CopyWithData data) => GetUserDetailsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      userID: data.get(#userID, or: $value.userID));

  @override
  GetUserDetailsParamsCopyWith<$R2, GetUserDetailsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetUserDetailsParamsCopyWithImpl($value, $cast, t);
}
