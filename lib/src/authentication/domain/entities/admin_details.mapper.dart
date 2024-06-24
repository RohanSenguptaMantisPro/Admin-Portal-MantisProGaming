// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'admin_details.dart';

class AdminDetailsMapper extends ClassMapperBase<AdminDetails> {
  AdminDetailsMapper._();

  static AdminDetailsMapper? _instance;
  static AdminDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdminDetails';

  static String _$accountType(AdminDetails v) => v.accountType;
  static const Field<AdminDetails, String> _f$accountType =
      Field('accountType', _$accountType);
  static String _$name(AdminDetails v) => v.name;
  static const Field<AdminDetails, String> _f$name = Field('name', _$name);
  static String _$email(AdminDetails v) => v.email;
  static const Field<AdminDetails, String> _f$email = Field('email', _$email);
  static String _$displayPicture(AdminDetails v) => v.displayPicture;
  static const Field<AdminDetails, String> _f$displayPicture =
      Field('displayPicture', _$displayPicture);

  @override
  final MappableFields<AdminDetails> fields = const {
    #accountType: _f$accountType,
    #name: _f$name,
    #email: _f$email,
    #displayPicture: _f$displayPicture,
  };

  static AdminDetails _instantiate(DecodingData data) {
    return AdminDetails(
        accountType: data.dec(_f$accountType),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        displayPicture: data.dec(_f$displayPicture));
  }

  @override
  final Function instantiate = _instantiate;

  static AdminDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdminDetails>(map);
  }

  static AdminDetails fromJson(String json) {
    return ensureInitialized().decodeJson<AdminDetails>(json);
  }
}

mixin AdminDetailsMappable {
  String toJson() {
    return AdminDetailsMapper.ensureInitialized()
        .encodeJson<AdminDetails>(this as AdminDetails);
  }

  Map<String, dynamic> toMap() {
    return AdminDetailsMapper.ensureInitialized()
        .encodeMap<AdminDetails>(this as AdminDetails);
  }

  AdminDetailsCopyWith<AdminDetails, AdminDetails, AdminDetails> get copyWith =>
      _AdminDetailsCopyWithImpl(this as AdminDetails, $identity, $identity);
  @override
  String toString() {
    return AdminDetailsMapper.ensureInitialized()
        .stringifyValue(this as AdminDetails);
  }

  @override
  bool operator ==(Object other) {
    return AdminDetailsMapper.ensureInitialized()
        .equalsValue(this as AdminDetails, other);
  }

  @override
  int get hashCode {
    return AdminDetailsMapper.ensureInitialized()
        .hashValue(this as AdminDetails);
  }
}

extension AdminDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdminDetails, $Out> {
  AdminDetailsCopyWith<$R, AdminDetails, $Out> get $asAdminDetails =>
      $base.as((v, t, t2) => _AdminDetailsCopyWithImpl(v, t, t2));
}

abstract class AdminDetailsCopyWith<$R, $In extends AdminDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? accountType,
      String? name,
      String? email,
      String? displayPicture});
  AdminDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AdminDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdminDetails, $Out>
    implements AdminDetailsCopyWith<$R, AdminDetails, $Out> {
  _AdminDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdminDetails> $mapper =
      AdminDetailsMapper.ensureInitialized();
  @override
  $R call(
          {String? accountType,
          String? name,
          String? email,
          String? displayPicture}) =>
      $apply(FieldCopyWithData({
        if (accountType != null) #accountType: accountType,
        if (name != null) #name: name,
        if (email != null) #email: email,
        if (displayPicture != null) #displayPicture: displayPicture
      }));
  @override
  AdminDetails $make(CopyWithData data) => AdminDetails(
      accountType: data.get(#accountType, or: $value.accountType),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      displayPicture: data.get(#displayPicture, or: $value.displayPicture));

  @override
  AdminDetailsCopyWith<$R2, AdminDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdminDetailsCopyWithImpl($value, $cast, t);
}
