// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'admin_details_model.dart';

class AdminDetailsModelMapper extends SubClassMapperBase<AdminDetailsModel> {
  AdminDetailsModelMapper._();

  static AdminDetailsModelMapper? _instance;
  static AdminDetailsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminDetailsModelMapper._());
      AdminDetailsMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AdminDetailsModel';

  static String _$accountType(AdminDetailsModel v) => v.accountType;
  static const Field<AdminDetailsModel, String> _f$accountType =
      Field('accountType', _$accountType);
  static String _$name(AdminDetailsModel v) => v.name;
  static const Field<AdminDetailsModel, String> _f$name = Field('name', _$name);
  static String _$email(AdminDetailsModel v) => v.email;
  static const Field<AdminDetailsModel, String> _f$email =
      Field('email', _$email);
  static String _$displayPicture(AdminDetailsModel v) => v.displayPicture;
  static const Field<AdminDetailsModel, String> _f$displayPicture =
      Field('displayPicture', _$displayPicture);

  @override
  final MappableFields<AdminDetailsModel> fields = const {
    #accountType: _f$accountType,
    #name: _f$name,
    #email: _f$email,
    #displayPicture: _f$displayPicture,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'adminDetailsModel';
  @override
  late final ClassMapperBase superMapper =
      AdminDetailsMapper.ensureInitialized();

  static AdminDetailsModel _instantiate(DecodingData data) {
    return AdminDetailsModel(
        accountType: data.dec(_f$accountType),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        displayPicture: data.dec(_f$displayPicture));
  }

  @override
  final Function instantiate = _instantiate;

  static AdminDetailsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdminDetailsModel>(map);
  }

  static AdminDetailsModel fromJson(String json) {
    return ensureInitialized().decodeJson<AdminDetailsModel>(json);
  }
}

mixin AdminDetailsModelMappable {
  String toJson() {
    return AdminDetailsModelMapper.ensureInitialized()
        .encodeJson<AdminDetailsModel>(this as AdminDetailsModel);
  }

  Map<String, dynamic> toMap() {
    return AdminDetailsModelMapper.ensureInitialized()
        .encodeMap<AdminDetailsModel>(this as AdminDetailsModel);
  }

  AdminDetailsModelCopyWith<AdminDetailsModel, AdminDetailsModel,
          AdminDetailsModel>
      get copyWith => _AdminDetailsModelCopyWithImpl(
          this as AdminDetailsModel, $identity, $identity);
  @override
  String toString() {
    return AdminDetailsModelMapper.ensureInitialized()
        .stringifyValue(this as AdminDetailsModel);
  }

  @override
  bool operator ==(Object other) {
    return AdminDetailsModelMapper.ensureInitialized()
        .equalsValue(this as AdminDetailsModel, other);
  }

  @override
  int get hashCode {
    return AdminDetailsModelMapper.ensureInitialized()
        .hashValue(this as AdminDetailsModel);
  }
}

extension AdminDetailsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdminDetailsModel, $Out> {
  AdminDetailsModelCopyWith<$R, AdminDetailsModel, $Out>
      get $asAdminDetailsModel =>
          $base.as((v, t, t2) => _AdminDetailsModelCopyWithImpl(v, t, t2));
}

abstract class AdminDetailsModelCopyWith<$R, $In extends AdminDetailsModel,
    $Out> implements AdminDetailsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? accountType,
      String? name,
      String? email,
      String? displayPicture});
  AdminDetailsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdminDetailsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdminDetailsModel, $Out>
    implements AdminDetailsModelCopyWith<$R, AdminDetailsModel, $Out> {
  _AdminDetailsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdminDetailsModel> $mapper =
      AdminDetailsModelMapper.ensureInitialized();
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
  AdminDetailsModel $make(CopyWithData data) => AdminDetailsModel(
      accountType: data.get(#accountType, or: $value.accountType),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      displayPicture: data.get(#displayPicture, or: $value.displayPicture));

  @override
  AdminDetailsModelCopyWith<$R2, AdminDetailsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdminDetailsModelCopyWithImpl($value, $cast, t);
}
