// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_data.dart';

class UserDataMapper extends ClassMapperBase<UserData> {
  UserDataMapper._();

  static UserDataMapper? _instance;
  static UserDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserData';

  static String _$id(UserData v) => v.id;
  static const Field<UserData, String> _f$id = Field('id', _$id);
  static String _$name(UserData v) => v.name;
  static const Field<UserData, String> _f$name = Field('name', _$name);
  static String _$userName(UserData v) => v.userName;
  static const Field<UserData, String> _f$userName =
      Field('userName', _$userName);
  static String _$email(UserData v) => v.email;
  static const Field<UserData, String> _f$email = Field('email', _$email);

  @override
  final MappableFields<UserData> fields = const {
    #id: _f$id,
    #name: _f$name,
    #userName: _f$userName,
    #email: _f$email,
  };

  static UserData _instantiate(DecodingData data) {
    return UserData(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        userName: data.dec(_f$userName),
        email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static UserData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserData>(map);
  }

  static UserData fromJson(String json) {
    return ensureInitialized().decodeJson<UserData>(json);
  }
}

mixin UserDataMappable {
  String toJson() {
    return UserDataMapper.ensureInitialized()
        .encodeJson<UserData>(this as UserData);
  }

  Map<String, dynamic> toMap() {
    return UserDataMapper.ensureInitialized()
        .encodeMap<UserData>(this as UserData);
  }

  UserDataCopyWith<UserData, UserData, UserData> get copyWith =>
      _UserDataCopyWithImpl(this as UserData, $identity, $identity);
  @override
  String toString() {
    return UserDataMapper.ensureInitialized().stringifyValue(this as UserData);
  }

  @override
  bool operator ==(Object other) {
    return UserDataMapper.ensureInitialized()
        .equalsValue(this as UserData, other);
  }

  @override
  int get hashCode {
    return UserDataMapper.ensureInitialized().hashValue(this as UserData);
  }
}

extension UserDataValueCopy<$R, $Out> on ObjectCopyWith<$R, UserData, $Out> {
  UserDataCopyWith<$R, UserData, $Out> get $asUserData =>
      $base.as((v, t, t2) => _UserDataCopyWithImpl(v, t, t2));
}

abstract class UserDataCopyWith<$R, $In extends UserData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? userName, String? email});
  UserDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserData, $Out>
    implements UserDataCopyWith<$R, UserData, $Out> {
  _UserDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserData> $mapper =
      UserDataMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? userName, String? email}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (userName != null) #userName: userName,
        if (email != null) #email: email
      }));
  @override
  UserData $make(CopyWithData data) => UserData(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      userName: data.get(#userName, or: $value.userName),
      email: data.get(#email, or: $value.email));

  @override
  UserDataCopyWith<$R2, UserData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDataCopyWithImpl($value, $cast, t);
}
