// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_details_bloc.dart';

class UserDetailsEventMapper extends ClassMapperBase<UserDetailsEvent> {
  UserDetailsEventMapper._();

  static UserDetailsEventMapper? _instance;
  static UserDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsEventMapper._());
      GetUserDetailsEventMapper.ensureInitialized();
      UpdateUserDetailsEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsEvent';

  @override
  final MappableFields<UserDetailsEvent> fields = const {};

  static UserDetailsEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('UserDetailsEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsEvent>(map);
  }

  static UserDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsEvent>(json);
  }
}

mixin UserDetailsEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  UserDetailsEventCopyWith<UserDetailsEvent, UserDetailsEvent, UserDetailsEvent>
      get copyWith;
}

abstract class UserDetailsEventCopyWith<$R, $In extends UserDetailsEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UserDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class GetUserDetailsEventMapper extends ClassMapperBase<GetUserDetailsEvent> {
  GetUserDetailsEventMapper._();

  static GetUserDetailsEventMapper? _instance;
  static GetUserDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetUserDetailsEventMapper._());
      UserDetailsEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GetUserDetailsEvent';

  static String _$userToken(GetUserDetailsEvent v) => v.userToken;
  static const Field<GetUserDetailsEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$userID(GetUserDetailsEvent v) => v.userID;
  static const Field<GetUserDetailsEvent, String> _f$userID =
      Field('userID', _$userID);

  @override
  final MappableFields<GetUserDetailsEvent> fields = const {
    #userToken: _f$userToken,
    #userID: _f$userID,
  };

  static GetUserDetailsEvent _instantiate(DecodingData data) {
    return GetUserDetailsEvent(
        userToken: data.dec(_f$userToken), userID: data.dec(_f$userID));
  }

  @override
  final Function instantiate = _instantiate;

  static GetUserDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetUserDetailsEvent>(map);
  }

  static GetUserDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<GetUserDetailsEvent>(json);
  }
}

mixin GetUserDetailsEventMappable {
  String toJson() {
    return GetUserDetailsEventMapper.ensureInitialized()
        .encodeJson<GetUserDetailsEvent>(this as GetUserDetailsEvent);
  }

  Map<String, dynamic> toMap() {
    return GetUserDetailsEventMapper.ensureInitialized()
        .encodeMap<GetUserDetailsEvent>(this as GetUserDetailsEvent);
  }

  GetUserDetailsEventCopyWith<GetUserDetailsEvent, GetUserDetailsEvent,
          GetUserDetailsEvent>
      get copyWith => _GetUserDetailsEventCopyWithImpl(
          this as GetUserDetailsEvent, $identity, $identity);
  @override
  String toString() {
    return GetUserDetailsEventMapper.ensureInitialized()
        .stringifyValue(this as GetUserDetailsEvent);
  }

  @override
  bool operator ==(Object other) {
    return GetUserDetailsEventMapper.ensureInitialized()
        .equalsValue(this as GetUserDetailsEvent, other);
  }

  @override
  int get hashCode {
    return GetUserDetailsEventMapper.ensureInitialized()
        .hashValue(this as GetUserDetailsEvent);
  }
}

extension GetUserDetailsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetUserDetailsEvent, $Out> {
  GetUserDetailsEventCopyWith<$R, GetUserDetailsEvent, $Out>
      get $asGetUserDetailsEvent =>
          $base.as((v, t, t2) => _GetUserDetailsEventCopyWithImpl(v, t, t2));
}

abstract class GetUserDetailsEventCopyWith<$R, $In extends GetUserDetailsEvent,
    $Out> implements UserDetailsEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken, String? userID});
  GetUserDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetUserDetailsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetUserDetailsEvent, $Out>
    implements GetUserDetailsEventCopyWith<$R, GetUserDetailsEvent, $Out> {
  _GetUserDetailsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetUserDetailsEvent> $mapper =
      GetUserDetailsEventMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? userID}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (userID != null) #userID: userID
      }));
  @override
  GetUserDetailsEvent $make(CopyWithData data) => GetUserDetailsEvent(
      userToken: data.get(#userToken, or: $value.userToken),
      userID: data.get(#userID, or: $value.userID));

  @override
  GetUserDetailsEventCopyWith<$R2, GetUserDetailsEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetUserDetailsEventCopyWithImpl($value, $cast, t);
}

class UpdateUserDetailsEventMapper
    extends ClassMapperBase<UpdateUserDetailsEvent> {
  UpdateUserDetailsEventMapper._();

  static UpdateUserDetailsEventMapper? _instance;
  static UpdateUserDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateUserDetailsEventMapper._());
      UserDetailsEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserDetailsEvent';

  static String _$userToken(UpdateUserDetailsEvent v) => v.userToken;
  static const Field<UpdateUserDetailsEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$userID(UpdateUserDetailsEvent v) => v.userID;
  static const Field<UpdateUserDetailsEvent, String> _f$userID =
      Field('userID', _$userID);
  static String _$accountStatus(UpdateUserDetailsEvent v) => v.accountStatus;
  static const Field<UpdateUserDetailsEvent, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus);

  @override
  final MappableFields<UpdateUserDetailsEvent> fields = const {
    #userToken: _f$userToken,
    #userID: _f$userID,
    #accountStatus: _f$accountStatus,
  };

  static UpdateUserDetailsEvent _instantiate(DecodingData data) {
    return UpdateUserDetailsEvent(
        userToken: data.dec(_f$userToken),
        userID: data.dec(_f$userID),
        accountStatus: data.dec(_f$accountStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserDetailsEvent>(map);
  }

  static UpdateUserDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUserDetailsEvent>(json);
  }
}

mixin UpdateUserDetailsEventMappable {
  String toJson() {
    return UpdateUserDetailsEventMapper.ensureInitialized()
        .encodeJson<UpdateUserDetailsEvent>(this as UpdateUserDetailsEvent);
  }

  Map<String, dynamic> toMap() {
    return UpdateUserDetailsEventMapper.ensureInitialized()
        .encodeMap<UpdateUserDetailsEvent>(this as UpdateUserDetailsEvent);
  }

  UpdateUserDetailsEventCopyWith<UpdateUserDetailsEvent, UpdateUserDetailsEvent,
          UpdateUserDetailsEvent>
      get copyWith => _UpdateUserDetailsEventCopyWithImpl(
          this as UpdateUserDetailsEvent, $identity, $identity);
  @override
  String toString() {
    return UpdateUserDetailsEventMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserDetailsEvent);
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserDetailsEventMapper.ensureInitialized()
        .equalsValue(this as UpdateUserDetailsEvent, other);
  }

  @override
  int get hashCode {
    return UpdateUserDetailsEventMapper.ensureInitialized()
        .hashValue(this as UpdateUserDetailsEvent);
  }
}

extension UpdateUserDetailsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserDetailsEvent, $Out> {
  UpdateUserDetailsEventCopyWith<$R, UpdateUserDetailsEvent, $Out>
      get $asUpdateUserDetailsEvent =>
          $base.as((v, t, t2) => _UpdateUserDetailsEventCopyWithImpl(v, t, t2));
}

abstract class UpdateUserDetailsEventCopyWith<
    $R,
    $In extends UpdateUserDetailsEvent,
    $Out> implements UserDetailsEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken, String? userID, String? accountStatus});
  UpdateUserDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserDetailsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserDetailsEvent, $Out>
    implements
        UpdateUserDetailsEventCopyWith<$R, UpdateUserDetailsEvent, $Out> {
  _UpdateUserDetailsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserDetailsEvent> $mapper =
      UpdateUserDetailsEventMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? userID, String? accountStatus}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (userID != null) #userID: userID,
        if (accountStatus != null) #accountStatus: accountStatus
      }));
  @override
  UpdateUserDetailsEvent $make(CopyWithData data) => UpdateUserDetailsEvent(
      userToken: data.get(#userToken, or: $value.userToken),
      userID: data.get(#userID, or: $value.userID),
      accountStatus: data.get(#accountStatus, or: $value.accountStatus));

  @override
  UpdateUserDetailsEventCopyWith<$R2, UpdateUserDetailsEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserDetailsEventCopyWithImpl($value, $cast, t);
}

class UserDetailsStateMapper extends ClassMapperBase<UserDetailsState> {
  UserDetailsStateMapper._();

  static UserDetailsStateMapper? _instance;
  static UserDetailsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsStateMapper._());
      UserDetailsInitialMapper.ensureInitialized();
      GettingUserDetailsMapper.ensureInitialized();
      UpdatingUserDetailsMapper.ensureInitialized();
      GotUserDetailsMapper.ensureInitialized();
      UpdatedUserDetailsMapper.ensureInitialized();
      GetUserDetailsErrorMapper.ensureInitialized();
      UpdateUserDetailsErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsState';

  @override
  final MappableFields<UserDetailsState> fields = const {};

  static UserDetailsState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('UserDetailsState');
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsState>(map);
  }

  static UserDetailsState fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsState>(json);
  }
}

mixin UserDetailsStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  UserDetailsStateCopyWith<UserDetailsState, UserDetailsState, UserDetailsState>
      get copyWith;
}

abstract class UserDetailsStateCopyWith<$R, $In extends UserDetailsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UserDetailsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class UserDetailsInitialMapper extends ClassMapperBase<UserDetailsInitial> {
  UserDetailsInitialMapper._();

  static UserDetailsInitialMapper? _instance;
  static UserDetailsInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsInitialMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsInitial';

  @override
  final MappableFields<UserDetailsInitial> fields = const {};

  static UserDetailsInitial _instantiate(DecodingData data) {
    return UserDetailsInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsInitial>(map);
  }

  static UserDetailsInitial fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsInitial>(json);
  }
}

mixin UserDetailsInitialMappable {
  String toJson() {
    return UserDetailsInitialMapper.ensureInitialized()
        .encodeJson<UserDetailsInitial>(this as UserDetailsInitial);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsInitialMapper.ensureInitialized()
        .encodeMap<UserDetailsInitial>(this as UserDetailsInitial);
  }

  UserDetailsInitialCopyWith<UserDetailsInitial, UserDetailsInitial,
          UserDetailsInitial>
      get copyWith => _UserDetailsInitialCopyWithImpl(
          this as UserDetailsInitial, $identity, $identity);
  @override
  String toString() {
    return UserDetailsInitialMapper.ensureInitialized()
        .stringifyValue(this as UserDetailsInitial);
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsInitialMapper.ensureInitialized()
        .equalsValue(this as UserDetailsInitial, other);
  }

  @override
  int get hashCode {
    return UserDetailsInitialMapper.ensureInitialized()
        .hashValue(this as UserDetailsInitial);
  }
}

extension UserDetailsInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailsInitial, $Out> {
  UserDetailsInitialCopyWith<$R, UserDetailsInitial, $Out>
      get $asUserDetailsInitial =>
          $base.as((v, t, t2) => _UserDetailsInitialCopyWithImpl(v, t, t2));
}

abstract class UserDetailsInitialCopyWith<$R, $In extends UserDetailsInitial,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UserDetailsInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserDetailsInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailsInitial, $Out>
    implements UserDetailsInitialCopyWith<$R, UserDetailsInitial, $Out> {
  _UserDetailsInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailsInitial> $mapper =
      UserDetailsInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UserDetailsInitial $make(CopyWithData data) => UserDetailsInitial();

  @override
  UserDetailsInitialCopyWith<$R2, UserDetailsInitial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailsInitialCopyWithImpl($value, $cast, t);
}

class GettingUserDetailsMapper extends ClassMapperBase<GettingUserDetails> {
  GettingUserDetailsMapper._();

  static GettingUserDetailsMapper? _instance;
  static GettingUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GettingUserDetailsMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GettingUserDetails';

  @override
  final MappableFields<GettingUserDetails> fields = const {};

  static GettingUserDetails _instantiate(DecodingData data) {
    return GettingUserDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static GettingUserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GettingUserDetails>(map);
  }

  static GettingUserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<GettingUserDetails>(json);
  }
}

mixin GettingUserDetailsMappable {
  String toJson() {
    return GettingUserDetailsMapper.ensureInitialized()
        .encodeJson<GettingUserDetails>(this as GettingUserDetails);
  }

  Map<String, dynamic> toMap() {
    return GettingUserDetailsMapper.ensureInitialized()
        .encodeMap<GettingUserDetails>(this as GettingUserDetails);
  }

  GettingUserDetailsCopyWith<GettingUserDetails, GettingUserDetails,
          GettingUserDetails>
      get copyWith => _GettingUserDetailsCopyWithImpl(
          this as GettingUserDetails, $identity, $identity);
  @override
  String toString() {
    return GettingUserDetailsMapper.ensureInitialized()
        .stringifyValue(this as GettingUserDetails);
  }

  @override
  bool operator ==(Object other) {
    return GettingUserDetailsMapper.ensureInitialized()
        .equalsValue(this as GettingUserDetails, other);
  }

  @override
  int get hashCode {
    return GettingUserDetailsMapper.ensureInitialized()
        .hashValue(this as GettingUserDetails);
  }
}

extension GettingUserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GettingUserDetails, $Out> {
  GettingUserDetailsCopyWith<$R, GettingUserDetails, $Out>
      get $asGettingUserDetails =>
          $base.as((v, t, t2) => _GettingUserDetailsCopyWithImpl(v, t, t2));
}

abstract class GettingUserDetailsCopyWith<$R, $In extends GettingUserDetails,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GettingUserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GettingUserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GettingUserDetails, $Out>
    implements GettingUserDetailsCopyWith<$R, GettingUserDetails, $Out> {
  _GettingUserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GettingUserDetails> $mapper =
      GettingUserDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GettingUserDetails $make(CopyWithData data) => GettingUserDetails();

  @override
  GettingUserDetailsCopyWith<$R2, GettingUserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GettingUserDetailsCopyWithImpl($value, $cast, t);
}

class UpdatingUserDetailsMapper extends ClassMapperBase<UpdatingUserDetails> {
  UpdatingUserDetailsMapper._();

  static UpdatingUserDetailsMapper? _instance;
  static UpdatingUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdatingUserDetailsMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdatingUserDetails';

  @override
  final MappableFields<UpdatingUserDetails> fields = const {};

  static UpdatingUserDetails _instantiate(DecodingData data) {
    return UpdatingUserDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static UpdatingUserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdatingUserDetails>(map);
  }

  static UpdatingUserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<UpdatingUserDetails>(json);
  }
}

mixin UpdatingUserDetailsMappable {
  String toJson() {
    return UpdatingUserDetailsMapper.ensureInitialized()
        .encodeJson<UpdatingUserDetails>(this as UpdatingUserDetails);
  }

  Map<String, dynamic> toMap() {
    return UpdatingUserDetailsMapper.ensureInitialized()
        .encodeMap<UpdatingUserDetails>(this as UpdatingUserDetails);
  }

  UpdatingUserDetailsCopyWith<UpdatingUserDetails, UpdatingUserDetails,
          UpdatingUserDetails>
      get copyWith => _UpdatingUserDetailsCopyWithImpl(
          this as UpdatingUserDetails, $identity, $identity);
  @override
  String toString() {
    return UpdatingUserDetailsMapper.ensureInitialized()
        .stringifyValue(this as UpdatingUserDetails);
  }

  @override
  bool operator ==(Object other) {
    return UpdatingUserDetailsMapper.ensureInitialized()
        .equalsValue(this as UpdatingUserDetails, other);
  }

  @override
  int get hashCode {
    return UpdatingUserDetailsMapper.ensureInitialized()
        .hashValue(this as UpdatingUserDetails);
  }
}

extension UpdatingUserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdatingUserDetails, $Out> {
  UpdatingUserDetailsCopyWith<$R, UpdatingUserDetails, $Out>
      get $asUpdatingUserDetails =>
          $base.as((v, t, t2) => _UpdatingUserDetailsCopyWithImpl(v, t, t2));
}

abstract class UpdatingUserDetailsCopyWith<$R, $In extends UpdatingUserDetails,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UpdatingUserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdatingUserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdatingUserDetails, $Out>
    implements UpdatingUserDetailsCopyWith<$R, UpdatingUserDetails, $Out> {
  _UpdatingUserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdatingUserDetails> $mapper =
      UpdatingUserDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UpdatingUserDetails $make(CopyWithData data) => UpdatingUserDetails();

  @override
  UpdatingUserDetailsCopyWith<$R2, UpdatingUserDetails, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdatingUserDetailsCopyWithImpl($value, $cast, t);
}

class GotUserDetailsMapper extends ClassMapperBase<GotUserDetails> {
  GotUserDetailsMapper._();

  static GotUserDetailsMapper? _instance;
  static GotUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GotUserDetailsMapper._());
      UserDetailsStateMapper.ensureInitialized();
      UserDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GotUserDetails';

  static UserDetails _$userDetails(GotUserDetails v) => v.userDetails;
  static const Field<GotUserDetails, UserDetails> _f$userDetails =
      Field('userDetails', _$userDetails);

  @override
  final MappableFields<GotUserDetails> fields = const {
    #userDetails: _f$userDetails,
  };

  static GotUserDetails _instantiate(DecodingData data) {
    return GotUserDetails(userDetails: data.dec(_f$userDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static GotUserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GotUserDetails>(map);
  }

  static GotUserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<GotUserDetails>(json);
  }
}

mixin GotUserDetailsMappable {
  String toJson() {
    return GotUserDetailsMapper.ensureInitialized()
        .encodeJson<GotUserDetails>(this as GotUserDetails);
  }

  Map<String, dynamic> toMap() {
    return GotUserDetailsMapper.ensureInitialized()
        .encodeMap<GotUserDetails>(this as GotUserDetails);
  }

  GotUserDetailsCopyWith<GotUserDetails, GotUserDetails, GotUserDetails>
      get copyWith => _GotUserDetailsCopyWithImpl(
          this as GotUserDetails, $identity, $identity);
  @override
  String toString() {
    return GotUserDetailsMapper.ensureInitialized()
        .stringifyValue(this as GotUserDetails);
  }

  @override
  bool operator ==(Object other) {
    return GotUserDetailsMapper.ensureInitialized()
        .equalsValue(this as GotUserDetails, other);
  }

  @override
  int get hashCode {
    return GotUserDetailsMapper.ensureInitialized()
        .hashValue(this as GotUserDetails);
  }
}

extension GotUserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GotUserDetails, $Out> {
  GotUserDetailsCopyWith<$R, GotUserDetails, $Out> get $asGotUserDetails =>
      $base.as((v, t, t2) => _GotUserDetailsCopyWithImpl(v, t, t2));
}

abstract class GotUserDetailsCopyWith<$R, $In extends GotUserDetails, $Out>
    implements UserDetailsStateCopyWith<$R, $In, $Out> {
  UserDetailsCopyWith<$R, UserDetails, UserDetails> get userDetails;
  @override
  $R call({UserDetails? userDetails});
  GotUserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GotUserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GotUserDetails, $Out>
    implements GotUserDetailsCopyWith<$R, GotUserDetails, $Out> {
  _GotUserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GotUserDetails> $mapper =
      GotUserDetailsMapper.ensureInitialized();
  @override
  UserDetailsCopyWith<$R, UserDetails, UserDetails> get userDetails =>
      $value.userDetails.copyWith.$chain((v) => call(userDetails: v));
  @override
  $R call({UserDetails? userDetails}) => $apply(
      FieldCopyWithData({if (userDetails != null) #userDetails: userDetails}));
  @override
  GotUserDetails $make(CopyWithData data) => GotUserDetails(
      userDetails: data.get(#userDetails, or: $value.userDetails));

  @override
  GotUserDetailsCopyWith<$R2, GotUserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GotUserDetailsCopyWithImpl($value, $cast, t);
}

class UpdatedUserDetailsMapper extends ClassMapperBase<UpdatedUserDetails> {
  UpdatedUserDetailsMapper._();

  static UpdatedUserDetailsMapper? _instance;
  static UpdatedUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdatedUserDetailsMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdatedUserDetails';

  @override
  final MappableFields<UpdatedUserDetails> fields = const {};

  static UpdatedUserDetails _instantiate(DecodingData data) {
    return UpdatedUserDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static UpdatedUserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdatedUserDetails>(map);
  }

  static UpdatedUserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<UpdatedUserDetails>(json);
  }
}

mixin UpdatedUserDetailsMappable {
  String toJson() {
    return UpdatedUserDetailsMapper.ensureInitialized()
        .encodeJson<UpdatedUserDetails>(this as UpdatedUserDetails);
  }

  Map<String, dynamic> toMap() {
    return UpdatedUserDetailsMapper.ensureInitialized()
        .encodeMap<UpdatedUserDetails>(this as UpdatedUserDetails);
  }

  UpdatedUserDetailsCopyWith<UpdatedUserDetails, UpdatedUserDetails,
          UpdatedUserDetails>
      get copyWith => _UpdatedUserDetailsCopyWithImpl(
          this as UpdatedUserDetails, $identity, $identity);
  @override
  String toString() {
    return UpdatedUserDetailsMapper.ensureInitialized()
        .stringifyValue(this as UpdatedUserDetails);
  }

  @override
  bool operator ==(Object other) {
    return UpdatedUserDetailsMapper.ensureInitialized()
        .equalsValue(this as UpdatedUserDetails, other);
  }

  @override
  int get hashCode {
    return UpdatedUserDetailsMapper.ensureInitialized()
        .hashValue(this as UpdatedUserDetails);
  }
}

extension UpdatedUserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdatedUserDetails, $Out> {
  UpdatedUserDetailsCopyWith<$R, UpdatedUserDetails, $Out>
      get $asUpdatedUserDetails =>
          $base.as((v, t, t2) => _UpdatedUserDetailsCopyWithImpl(v, t, t2));
}

abstract class UpdatedUserDetailsCopyWith<$R, $In extends UpdatedUserDetails,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UpdatedUserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdatedUserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdatedUserDetails, $Out>
    implements UpdatedUserDetailsCopyWith<$R, UpdatedUserDetails, $Out> {
  _UpdatedUserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdatedUserDetails> $mapper =
      UpdatedUserDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UpdatedUserDetails $make(CopyWithData data) => UpdatedUserDetails();

  @override
  UpdatedUserDetailsCopyWith<$R2, UpdatedUserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpdatedUserDetailsCopyWithImpl($value, $cast, t);
}

class GetUserDetailsErrorMapper extends ClassMapperBase<GetUserDetailsError> {
  GetUserDetailsErrorMapper._();

  static GetUserDetailsErrorMapper? _instance;
  static GetUserDetailsErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetUserDetailsErrorMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GetUserDetailsError';

  static String _$message(GetUserDetailsError v) => v.message;
  static const Field<GetUserDetailsError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<GetUserDetailsError> fields = const {
    #message: _f$message,
  };

  static GetUserDetailsError _instantiate(DecodingData data) {
    return GetUserDetailsError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static GetUserDetailsError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetUserDetailsError>(map);
  }

  static GetUserDetailsError fromJson(String json) {
    return ensureInitialized().decodeJson<GetUserDetailsError>(json);
  }
}

mixin GetUserDetailsErrorMappable {
  String toJson() {
    return GetUserDetailsErrorMapper.ensureInitialized()
        .encodeJson<GetUserDetailsError>(this as GetUserDetailsError);
  }

  Map<String, dynamic> toMap() {
    return GetUserDetailsErrorMapper.ensureInitialized()
        .encodeMap<GetUserDetailsError>(this as GetUserDetailsError);
  }

  GetUserDetailsErrorCopyWith<GetUserDetailsError, GetUserDetailsError,
          GetUserDetailsError>
      get copyWith => _GetUserDetailsErrorCopyWithImpl(
          this as GetUserDetailsError, $identity, $identity);
  @override
  String toString() {
    return GetUserDetailsErrorMapper.ensureInitialized()
        .stringifyValue(this as GetUserDetailsError);
  }

  @override
  bool operator ==(Object other) {
    return GetUserDetailsErrorMapper.ensureInitialized()
        .equalsValue(this as GetUserDetailsError, other);
  }

  @override
  int get hashCode {
    return GetUserDetailsErrorMapper.ensureInitialized()
        .hashValue(this as GetUserDetailsError);
  }
}

extension GetUserDetailsErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetUserDetailsError, $Out> {
  GetUserDetailsErrorCopyWith<$R, GetUserDetailsError, $Out>
      get $asGetUserDetailsError =>
          $base.as((v, t, t2) => _GetUserDetailsErrorCopyWithImpl(v, t, t2));
}

abstract class GetUserDetailsErrorCopyWith<$R, $In extends GetUserDetailsError,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  GetUserDetailsErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetUserDetailsErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetUserDetailsError, $Out>
    implements GetUserDetailsErrorCopyWith<$R, GetUserDetailsError, $Out> {
  _GetUserDetailsErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetUserDetailsError> $mapper =
      GetUserDetailsErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  GetUserDetailsError $make(CopyWithData data) =>
      GetUserDetailsError(message: data.get(#message, or: $value.message));

  @override
  GetUserDetailsErrorCopyWith<$R2, GetUserDetailsError, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetUserDetailsErrorCopyWithImpl($value, $cast, t);
}

class UpdateUserDetailsErrorMapper
    extends ClassMapperBase<UpdateUserDetailsError> {
  UpdateUserDetailsErrorMapper._();

  static UpdateUserDetailsErrorMapper? _instance;
  static UpdateUserDetailsErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateUserDetailsErrorMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserDetailsError';

  static String _$message(UpdateUserDetailsError v) => v.message;
  static const Field<UpdateUserDetailsError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<UpdateUserDetailsError> fields = const {
    #message: _f$message,
  };

  static UpdateUserDetailsError _instantiate(DecodingData data) {
    return UpdateUserDetailsError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserDetailsError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserDetailsError>(map);
  }

  static UpdateUserDetailsError fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUserDetailsError>(json);
  }
}

mixin UpdateUserDetailsErrorMappable {
  String toJson() {
    return UpdateUserDetailsErrorMapper.ensureInitialized()
        .encodeJson<UpdateUserDetailsError>(this as UpdateUserDetailsError);
  }

  Map<String, dynamic> toMap() {
    return UpdateUserDetailsErrorMapper.ensureInitialized()
        .encodeMap<UpdateUserDetailsError>(this as UpdateUserDetailsError);
  }

  UpdateUserDetailsErrorCopyWith<UpdateUserDetailsError, UpdateUserDetailsError,
          UpdateUserDetailsError>
      get copyWith => _UpdateUserDetailsErrorCopyWithImpl(
          this as UpdateUserDetailsError, $identity, $identity);
  @override
  String toString() {
    return UpdateUserDetailsErrorMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserDetailsError);
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserDetailsErrorMapper.ensureInitialized()
        .equalsValue(this as UpdateUserDetailsError, other);
  }

  @override
  int get hashCode {
    return UpdateUserDetailsErrorMapper.ensureInitialized()
        .hashValue(this as UpdateUserDetailsError);
  }
}

extension UpdateUserDetailsErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserDetailsError, $Out> {
  UpdateUserDetailsErrorCopyWith<$R, UpdateUserDetailsError, $Out>
      get $asUpdateUserDetailsError =>
          $base.as((v, t, t2) => _UpdateUserDetailsErrorCopyWithImpl(v, t, t2));
}

abstract class UpdateUserDetailsErrorCopyWith<
    $R,
    $In extends UpdateUserDetailsError,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  UpdateUserDetailsErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserDetailsErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserDetailsError, $Out>
    implements
        UpdateUserDetailsErrorCopyWith<$R, UpdateUserDetailsError, $Out> {
  _UpdateUserDetailsErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserDetailsError> $mapper =
      UpdateUserDetailsErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  UpdateUserDetailsError $make(CopyWithData data) =>
      UpdateUserDetailsError(message: data.get(#message, or: $value.message));

  @override
  UpdateUserDetailsErrorCopyWith<$R2, UpdateUserDetailsError, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserDetailsErrorCopyWithImpl($value, $cast, t);
}
