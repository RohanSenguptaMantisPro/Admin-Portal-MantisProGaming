// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_data_model.dart';

class UserDataModelMapper extends SubClassMapperBase<UserDataModel> {
  UserDataModelMapper._();

  static UserDataModelMapper? _instance;
  static UserDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDataModelMapper._());
      UserDataMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UserDataModel';

  static String _$id(UserDataModel v) => v.id;
  static const Field<UserDataModel, String> _f$id = Field('id', _$id);
  static String _$name(UserDataModel v) => v.name;
  static const Field<UserDataModel, String> _f$name = Field('name', _$name);
  static String _$email(UserDataModel v) => v.email;
  static const Field<UserDataModel, String> _f$email = Field('email', _$email);
  static String _$userName(UserDataModel v) => v.userName;
  static const Field<UserDataModel, String> _f$userName =
      Field('userName', _$userName);

  @override
  final MappableFields<UserDataModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #userName: _f$userName,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'userDataModel';
  @override
  late final ClassMapperBase superMapper = UserDataMapper.ensureInitialized();

  static UserDataModel _instantiate(DecodingData data) {
    return UserDataModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        userName: data.dec(_f$userName));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDataModel>(map);
  }

  static UserDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserDataModel>(json);
  }
}

mixin UserDataModelMappable {
  String toJson() {
    return UserDataModelMapper.ensureInitialized()
        .encodeJson<UserDataModel>(this as UserDataModel);
  }

  Map<String, dynamic> toMap() {
    return UserDataModelMapper.ensureInitialized()
        .encodeMap<UserDataModel>(this as UserDataModel);
  }

  UserDataModelCopyWith<UserDataModel, UserDataModel, UserDataModel>
      get copyWith => _UserDataModelCopyWithImpl(
          this as UserDataModel, $identity, $identity);
  @override
  String toString() {
    return UserDataModelMapper.ensureInitialized()
        .stringifyValue(this as UserDataModel);
  }

  @override
  bool operator ==(Object other) {
    return UserDataModelMapper.ensureInitialized()
        .equalsValue(this as UserDataModel, other);
  }

  @override
  int get hashCode {
    return UserDataModelMapper.ensureInitialized()
        .hashValue(this as UserDataModel);
  }
}

extension UserDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDataModel, $Out> {
  UserDataModelCopyWith<$R, UserDataModel, $Out> get $asUserDataModel =>
      $base.as((v, t, t2) => _UserDataModelCopyWithImpl(v, t, t2));
}

abstract class UserDataModelCopyWith<$R, $In extends UserDataModel, $Out>
    implements UserDataCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? name, String? email, String? userName});
  UserDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDataModel, $Out>
    implements UserDataModelCopyWith<$R, UserDataModel, $Out> {
  _UserDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDataModel> $mapper =
      UserDataModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? email, String? userName}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (userName != null) #userName: userName
      }));
  @override
  UserDataModel $make(CopyWithData data) => UserDataModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      userName: data.get(#userName, or: $value.userName));

  @override
  UserDataModelCopyWith<$R2, UserDataModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDataModelCopyWithImpl($value, $cast, t);
}
