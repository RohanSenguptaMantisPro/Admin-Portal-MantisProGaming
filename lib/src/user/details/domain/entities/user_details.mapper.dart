// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_details.dart';

class UserDetailsMapper extends ClassMapperBase<UserDetails> {
  UserDetailsMapper._();

  static UserDetailsMapper? _instance;
  static UserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetails';

  static String? _$id(UserDetails v) => v.id;
  static const Field<UserDetails, String> _f$id =
      Field('id', _$id, key: '_id', opt: true);
  static String? _$accountType(UserDetails v) => v.accountType;
  static const Field<UserDetails, String> _f$accountType =
      Field('accountType', _$accountType, opt: true);
  static String? _$name(UserDetails v) => v.name;
  static const Field<UserDetails, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$userName(UserDetails v) => v.userName;
  static const Field<UserDetails, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$googleId(UserDetails v) => v.googleId;
  static const Field<UserDetails, String> _f$googleId =
      Field('googleId', _$googleId, opt: true);
  static String? _$email(UserDetails v) => v.email;
  static const Field<UserDetails, String> _f$email =
      Field('email', _$email, opt: true);
  static bool? _$emailVerified(UserDetails v) => v.emailVerified;
  static const Field<UserDetails, bool> _f$emailVerified =
      Field('emailVerified', _$emailVerified, opt: true);
  static String? _$displayPicture(UserDetails v) => v.displayPicture;
  static const Field<UserDetails, String> _f$displayPicture =
      Field('displayPicture', _$displayPicture, opt: true);
  static int? _$role(UserDetails v) => v.role;
  static const Field<UserDetails, int> _f$role =
      Field('role', _$role, opt: true);
  static String? _$locale(UserDetails v) => v.locale;
  static const Field<UserDetails, String> _f$locale =
      Field('locale', _$locale, opt: true);
  static String? _$country(UserDetails v) => v.country;
  static const Field<UserDetails, String> _f$country =
      Field('country', _$country, opt: true);
  static int? _$creditsAvailable(UserDetails v) => v.creditsAvailable;
  static const Field<UserDetails, int> _f$creditsAvailable =
      Field('creditsAvailable', _$creditsAvailable, opt: true);
  static bool? _$accountActive(UserDetails v) => v.accountActive;
  static const Field<UserDetails, bool> _f$accountActive =
      Field('accountActive', _$accountActive, opt: true);
  static String? _$accountStatus(UserDetails v) => v.accountStatus;
  static const Field<UserDetails, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus, opt: true);
  static String? _$createdAt(UserDetails v) => v.createdAt;
  static const Field<UserDetails, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$updatedAt(UserDetails v) => v.updatedAt;
  static const Field<UserDetails, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<UserDetails> fields = const {
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

  static UserDetails _instantiate(DecodingData data) {
    return UserDetails(
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

  static UserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetails>(map);
  }

  static UserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetails>(json);
  }
}

mixin UserDetailsMappable {
  String toJson() {
    return UserDetailsMapper.ensureInitialized()
        .encodeJson<UserDetails>(this as UserDetails);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsMapper.ensureInitialized()
        .encodeMap<UserDetails>(this as UserDetails);
  }

  UserDetailsCopyWith<UserDetails, UserDetails, UserDetails> get copyWith =>
      _UserDetailsCopyWithImpl(this as UserDetails, $identity, $identity);
  @override
  String toString() {
    return UserDetailsMapper.ensureInitialized()
        .stringifyValue(this as UserDetails);
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsMapper.ensureInitialized()
        .equalsValue(this as UserDetails, other);
  }

  @override
  int get hashCode {
    return UserDetailsMapper.ensureInitialized().hashValue(this as UserDetails);
  }
}

extension UserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetails, $Out> {
  UserDetailsCopyWith<$R, UserDetails, $Out> get $asUserDetails =>
      $base.as((v, t, t2) => _UserDetailsCopyWithImpl(v, t, t2));
}

abstract class UserDetailsCopyWith<$R, $In extends UserDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
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
  UserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetails, $Out>
    implements UserDetailsCopyWith<$R, UserDetails, $Out> {
  _UserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetails> $mapper =
      UserDetailsMapper.ensureInitialized();
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
  UserDetails $make(CopyWithData data) => UserDetails(
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
  UserDetailsCopyWith<$R2, UserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailsCopyWithImpl($value, $cast, t);
}
