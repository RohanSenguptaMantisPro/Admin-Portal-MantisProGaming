// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_game_details.dart';

class GetGameDetailsParamsMapper extends ClassMapperBase<GetGameDetailsParams> {
  GetGameDetailsParamsMapper._();

  static GetGameDetailsParamsMapper? _instance;
  static GetGameDetailsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetGameDetailsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetGameDetailsParams';

  static String _$userToken(GetGameDetailsParams v) => v.userToken;
  static const Field<GetGameDetailsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$gameObjectId(GetGameDetailsParams v) => v.gameObjectId;
  static const Field<GetGameDetailsParams, String> _f$gameObjectId =
      Field('gameObjectId', _$gameObjectId);

  @override
  final MappableFields<GetGameDetailsParams> fields = const {
    #userToken: _f$userToken,
    #gameObjectId: _f$gameObjectId,
  };

  static GetGameDetailsParams _instantiate(DecodingData data) {
    return GetGameDetailsParams(
        userToken: data.dec(_f$userToken),
        gameObjectId: data.dec(_f$gameObjectId));
  }

  @override
  final Function instantiate = _instantiate;

  static GetGameDetailsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetGameDetailsParams>(map);
  }

  static GetGameDetailsParams fromJson(String json) {
    return ensureInitialized().decodeJson<GetGameDetailsParams>(json);
  }
}

mixin GetGameDetailsParamsMappable {
  String toJson() {
    return GetGameDetailsParamsMapper.ensureInitialized()
        .encodeJson<GetGameDetailsParams>(this as GetGameDetailsParams);
  }

  Map<String, dynamic> toMap() {
    return GetGameDetailsParamsMapper.ensureInitialized()
        .encodeMap<GetGameDetailsParams>(this as GetGameDetailsParams);
  }

  GetGameDetailsParamsCopyWith<GetGameDetailsParams, GetGameDetailsParams,
          GetGameDetailsParams>
      get copyWith => _GetGameDetailsParamsCopyWithImpl(
          this as GetGameDetailsParams, $identity, $identity);
  @override
  String toString() {
    return GetGameDetailsParamsMapper.ensureInitialized()
        .stringifyValue(this as GetGameDetailsParams);
  }

  @override
  bool operator ==(Object other) {
    return GetGameDetailsParamsMapper.ensureInitialized()
        .equalsValue(this as GetGameDetailsParams, other);
  }

  @override
  int get hashCode {
    return GetGameDetailsParamsMapper.ensureInitialized()
        .hashValue(this as GetGameDetailsParams);
  }
}

extension GetGameDetailsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetGameDetailsParams, $Out> {
  GetGameDetailsParamsCopyWith<$R, GetGameDetailsParams, $Out>
      get $asGetGameDetailsParams =>
          $base.as((v, t, t2) => _GetGameDetailsParamsCopyWithImpl(v, t, t2));
}

abstract class GetGameDetailsParamsCopyWith<
    $R,
    $In extends GetGameDetailsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? gameObjectId});
  GetGameDetailsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetGameDetailsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetGameDetailsParams, $Out>
    implements GetGameDetailsParamsCopyWith<$R, GetGameDetailsParams, $Out> {
  _GetGameDetailsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetGameDetailsParams> $mapper =
      GetGameDetailsParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? gameObjectId}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (gameObjectId != null) #gameObjectId: gameObjectId
      }));
  @override
  GetGameDetailsParams $make(CopyWithData data) => GetGameDetailsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      gameObjectId: data.get(#gameObjectId, or: $value.gameObjectId));

  @override
  GetGameDetailsParamsCopyWith<$R2, GetGameDetailsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetGameDetailsParamsCopyWithImpl($value, $cast, t);
}
