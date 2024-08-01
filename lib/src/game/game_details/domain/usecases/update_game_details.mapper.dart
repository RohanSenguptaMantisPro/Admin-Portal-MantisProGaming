// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_game_details.dart';

class UpdateGameDetailsParamsMapper
    extends ClassMapperBase<UpdateGameDetailsParams> {
  UpdateGameDetailsParamsMapper._();

  static UpdateGameDetailsParamsMapper? _instance;
  static UpdateGameDetailsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UpdateGameDetailsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateGameDetailsParams';

  static String _$userToken(UpdateGameDetailsParams v) => v.userToken;
  static const Field<UpdateGameDetailsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$gameObjectId(UpdateGameDetailsParams v) => v.gameObjectId;
  static const Field<UpdateGameDetailsParams, String> _f$gameObjectId =
      Field('gameObjectId', _$gameObjectId);
  static String _$gameName(UpdateGameDetailsParams v) => v.gameName;
  static const Field<UpdateGameDetailsParams, String> _f$gameName =
      Field('gameName', _$gameName);

  @override
  final MappableFields<UpdateGameDetailsParams> fields = const {
    #userToken: _f$userToken,
    #gameObjectId: _f$gameObjectId,
    #gameName: _f$gameName,
  };

  static UpdateGameDetailsParams _instantiate(DecodingData data) {
    return UpdateGameDetailsParams(
        userToken: data.dec(_f$userToken),
        gameObjectId: data.dec(_f$gameObjectId),
        gameName: data.dec(_f$gameName));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateGameDetailsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateGameDetailsParams>(map);
  }

  static UpdateGameDetailsParams fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateGameDetailsParams>(json);
  }
}

mixin UpdateGameDetailsParamsMappable {
  String toJson() {
    return UpdateGameDetailsParamsMapper.ensureInitialized()
        .encodeJson<UpdateGameDetailsParams>(this as UpdateGameDetailsParams);
  }

  Map<String, dynamic> toMap() {
    return UpdateGameDetailsParamsMapper.ensureInitialized()
        .encodeMap<UpdateGameDetailsParams>(this as UpdateGameDetailsParams);
  }

  UpdateGameDetailsParamsCopyWith<UpdateGameDetailsParams,
          UpdateGameDetailsParams, UpdateGameDetailsParams>
      get copyWith => _UpdateGameDetailsParamsCopyWithImpl(
          this as UpdateGameDetailsParams, $identity, $identity);
  @override
  String toString() {
    return UpdateGameDetailsParamsMapper.ensureInitialized()
        .stringifyValue(this as UpdateGameDetailsParams);
  }

  @override
  bool operator ==(Object other) {
    return UpdateGameDetailsParamsMapper.ensureInitialized()
        .equalsValue(this as UpdateGameDetailsParams, other);
  }

  @override
  int get hashCode {
    return UpdateGameDetailsParamsMapper.ensureInitialized()
        .hashValue(this as UpdateGameDetailsParams);
  }
}

extension UpdateGameDetailsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateGameDetailsParams, $Out> {
  UpdateGameDetailsParamsCopyWith<$R, UpdateGameDetailsParams, $Out>
      get $asUpdateGameDetailsParams => $base
          .as((v, t, t2) => _UpdateGameDetailsParamsCopyWithImpl(v, t, t2));
}

abstract class UpdateGameDetailsParamsCopyWith<
    $R,
    $In extends UpdateGameDetailsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userToken, String? gameObjectId, String? gameName});
  UpdateGameDetailsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateGameDetailsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateGameDetailsParams, $Out>
    implements
        UpdateGameDetailsParamsCopyWith<$R, UpdateGameDetailsParams, $Out> {
  _UpdateGameDetailsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateGameDetailsParams> $mapper =
      UpdateGameDetailsParamsMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? gameObjectId, String? gameName}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (gameObjectId != null) #gameObjectId: gameObjectId,
        if (gameName != null) #gameName: gameName
      }));
  @override
  UpdateGameDetailsParams $make(CopyWithData data) => UpdateGameDetailsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      gameObjectId: data.get(#gameObjectId, or: $value.gameObjectId),
      gameName: data.get(#gameName, or: $value.gameName));

  @override
  UpdateGameDetailsParamsCopyWith<$R2, UpdateGameDetailsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateGameDetailsParamsCopyWithImpl($value, $cast, t);
}
