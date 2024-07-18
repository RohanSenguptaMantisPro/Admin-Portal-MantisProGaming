// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_details_model.dart';

class UserDetailsModelMapper extends SubClassMapperBase<UserDetailsModel> {
  UserDetailsModelMapper._();

  static UserDetailsModelMapper? _instance;
  static UserDetailsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsModelMapper._());
      UserDetailsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsModel';

  static String? _$id(UserDetailsModel v) => v.id;
  static const Field<UserDetailsModel, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$accountType(UserDetailsModel v) => v.accountType;
  static const Field<UserDetailsModel, String> _f$accountType =
      Field('accountType', _$accountType, opt: true);
  static String? _$name(UserDetailsModel v) => v.name;
  static const Field<UserDetailsModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$userName(UserDetailsModel v) => v.userName;
  static const Field<UserDetailsModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$googleId(UserDetailsModel v) => v.googleId;
  static const Field<UserDetailsModel, String> _f$googleId =
      Field('googleId', _$googleId, opt: true);
  static String? _$email(UserDetailsModel v) => v.email;
  static const Field<UserDetailsModel, String> _f$email =
      Field('email', _$email, opt: true);
  static bool? _$emailVerified(UserDetailsModel v) => v.emailVerified;
  static const Field<UserDetailsModel, bool> _f$emailVerified =
      Field('emailVerified', _$emailVerified, opt: true);
  static String? _$displayPicture(UserDetailsModel v) => v.displayPicture;
  static const Field<UserDetailsModel, String> _f$displayPicture =
      Field('displayPicture', _$displayPicture, opt: true);
  static int? _$role(UserDetailsModel v) => v.role;
  static const Field<UserDetailsModel, int> _f$role =
      Field('role', _$role, opt: true);
  static String? _$locale(UserDetailsModel v) => v.locale;
  static const Field<UserDetailsModel, String> _f$locale =
      Field('locale', _$locale, opt: true);
  static String? _$country(UserDetailsModel v) => v.country;
  static const Field<UserDetailsModel, String> _f$country =
      Field('country', _$country, opt: true);
  static int? _$creditsAvailable(UserDetailsModel v) => v.creditsAvailable;
  static const Field<UserDetailsModel, int> _f$creditsAvailable =
      Field('creditsAvailable', _$creditsAvailable, opt: true);
  static bool? _$accountActive(UserDetailsModel v) => v.accountActive;
  static const Field<UserDetailsModel, bool> _f$accountActive =
      Field('accountActive', _$accountActive, opt: true);
  static String? _$accountStatus(UserDetailsModel v) => v.accountStatus;
  static const Field<UserDetailsModel, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus, opt: true);
  static String? _$createdAt(UserDetailsModel v) => v.createdAt;
  static const Field<UserDetailsModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$updatedAt(UserDetailsModel v) => v.updatedAt;
  static const Field<UserDetailsModel, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<UserDetailsModel> fields = const {
    #id: _f$id,
    #accountType: _f$accountType,
    #name: _f$name,
    #userName: _f$userName,
    #googleId: _f$googleId,
    #email: _f$email,
    #emailVerified: _f$emailVerified,
    #displayPicture: _f$displayPicture,
    #role: _f$role,
    #locale: _f$locale,
    #country: _f$country,
    #creditsAvailable: _f$creditsAvailable,
    #accountActive: _f$accountActive,
    #accountStatus: _f$accountStatus,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'userDetailsModel';
  @override
  late final ClassMapperBase superMapper =
      UserDetailsMapper.ensureInitialized();

  static UserDetailsModel _instantiate(DecodingData data) {
    return UserDetailsModel(
        id: data.dec(_f$id),
        accountType: data.dec(_f$accountType),
        name: data.dec(_f$name),
        userName: data.dec(_f$userName),
        googleId: data.dec(_f$googleId),
        email: data.dec(_f$email),
        emailVerified: data.dec(_f$emailVerified),
        displayPicture: data.dec(_f$displayPicture),
        role: data.dec(_f$role),
        locale: data.dec(_f$locale),
        country: data.dec(_f$country),
        creditsAvailable: data.dec(_f$creditsAvailable),
        accountActive: data.dec(_f$accountActive),
        accountStatus: data.dec(_f$accountStatus),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsModel>(map);
  }

  static UserDetailsModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsModel>(json);
  }
}

mixin UserDetailsModelMappable {
  String toJson() {
    return UserDetailsModelMapper.ensureInitialized()
        .encodeJson<UserDetailsModel>(this as UserDetailsModel);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsModelMapper.ensureInitialized()
        .encodeMap<UserDetailsModel>(this as UserDetailsModel);
  }

  UserDetailsModelCopyWith<UserDetailsModel, UserDetailsModel, UserDetailsModel>
      get copyWith => _UserDetailsModelCopyWithImpl(
          this as UserDetailsModel, $identity, $identity);
  @override
  String toString() {
    return UserDetailsModelMapper.ensureInitialized()
        .stringifyValue(this as UserDetailsModel);
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsModelMapper.ensureInitialized()
        .equalsValue(this as UserDetailsModel, other);
  }

  @override
  int get hashCode {
    return UserDetailsModelMapper.ensureInitialized()
        .hashValue(this as UserDetailsModel);
  }
}

extension UserDetailsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailsModel, $Out> {
  UserDetailsModelCopyWith<$R, UserDetailsModel, $Out>
      get $asUserDetailsModel =>
          $base.as((v, t, t2) => _UserDetailsModelCopyWithImpl(v, t, t2));
}

abstract class UserDetailsModelCopyWith<$R, $In extends UserDetailsModel, $Out>
    implements UserDetailsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? accountType,
      String? name,
      String? userName,
      String? googleId,
      String? email,
      bool? emailVerified,
      String? displayPicture,
      int? role,
      String? locale,
      String? country,
      int? creditsAvailable,
      bool? accountActive,
      String? accountStatus,
      String? createdAt,
      String? updatedAt});
  UserDetailsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserDetailsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailsModel, $Out>
    implements UserDetailsModelCopyWith<$R, UserDetailsModel, $Out> {
  _UserDetailsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailsModel> $mapper =
      UserDetailsModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? accountType = $none,
          Object? name = $none,
          Object? userName = $none,
          Object? googleId = $none,
          Object? email = $none,
          Object? emailVerified = $none,
          Object? displayPicture = $none,
          Object? role = $none,
          Object? locale = $none,
          Object? country = $none,
          Object? creditsAvailable = $none,
          Object? accountActive = $none,
          Object? accountStatus = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (accountType != $none) #accountType: accountType,
        if (name != $none) #name: name,
        if (userName != $none) #userName: userName,
        if (googleId != $none) #googleId: googleId,
        if (email != $none) #email: email,
        if (emailVerified != $none) #emailVerified: emailVerified,
        if (displayPicture != $none) #displayPicture: displayPicture,
        if (role != $none) #role: role,
        if (locale != $none) #locale: locale,
        if (country != $none) #country: country,
        if (creditsAvailable != $none) #creditsAvailable: creditsAvailable,
        if (accountActive != $none) #accountActive: accountActive,
        if (accountStatus != $none) #accountStatus: accountStatus,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  UserDetailsModel $make(CopyWithData data) => UserDetailsModel(
      id: data.get(#id, or: $value.id),
      accountType: data.get(#accountType, or: $value.accountType),
      name: data.get(#name, or: $value.name),
      userName: data.get(#userName, or: $value.userName),
      googleId: data.get(#googleId, or: $value.googleId),
      email: data.get(#email, or: $value.email),
      emailVerified: data.get(#emailVerified, or: $value.emailVerified),
      displayPicture: data.get(#displayPicture, or: $value.displayPicture),
      role: data.get(#role, or: $value.role),
      locale: data.get(#locale, or: $value.locale),
      country: data.get(#country, or: $value.country),
      creditsAvailable:
          data.get(#creditsAvailable, or: $value.creditsAvailable),
      accountActive: data.get(#accountActive, or: $value.accountActive),
      accountStatus: data.get(#accountStatus, or: $value.accountStatus),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  UserDetailsModelCopyWith<$R2, UserDetailsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailsModelCopyWithImpl($value, $cast, t);
}
