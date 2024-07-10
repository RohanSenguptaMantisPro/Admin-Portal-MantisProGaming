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
      UserDetailsLoadingMapper.ensureInitialized();
      UserDetailsErrorMapper.ensureInitialized();
      FetchedUserDetailsMapper.ensureInitialized();
      UpdatingUserDetailsMapper.ensureInitialized();
      UpdatedUserDetailsMapper.ensureInitialized();
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

class UserDetailsLoadingMapper extends ClassMapperBase<UserDetailsLoading> {
  UserDetailsLoadingMapper._();

  static UserDetailsLoadingMapper? _instance;
  static UserDetailsLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsLoadingMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsLoading';

  @override
  final MappableFields<UserDetailsLoading> fields = const {};

  static UserDetailsLoading _instantiate(DecodingData data) {
    return UserDetailsLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsLoading>(map);
  }

  static UserDetailsLoading fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsLoading>(json);
  }
}

mixin UserDetailsLoadingMappable {
  String toJson() {
    return UserDetailsLoadingMapper.ensureInitialized()
        .encodeJson<UserDetailsLoading>(this as UserDetailsLoading);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsLoadingMapper.ensureInitialized()
        .encodeMap<UserDetailsLoading>(this as UserDetailsLoading);
  }

  UserDetailsLoadingCopyWith<UserDetailsLoading, UserDetailsLoading,
          UserDetailsLoading>
      get copyWith => _UserDetailsLoadingCopyWithImpl(
          this as UserDetailsLoading, $identity, $identity);
  @override
  String toString() {
    return UserDetailsLoadingMapper.ensureInitialized()
        .stringifyValue(this as UserDetailsLoading);
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsLoadingMapper.ensureInitialized()
        .equalsValue(this as UserDetailsLoading, other);
  }

  @override
  int get hashCode {
    return UserDetailsLoadingMapper.ensureInitialized()
        .hashValue(this as UserDetailsLoading);
  }
}

extension UserDetailsLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailsLoading, $Out> {
  UserDetailsLoadingCopyWith<$R, UserDetailsLoading, $Out>
      get $asUserDetailsLoading =>
          $base.as((v, t, t2) => _UserDetailsLoadingCopyWithImpl(v, t, t2));
}

abstract class UserDetailsLoadingCopyWith<$R, $In extends UserDetailsLoading,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UserDetailsLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserDetailsLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailsLoading, $Out>
    implements UserDetailsLoadingCopyWith<$R, UserDetailsLoading, $Out> {
  _UserDetailsLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailsLoading> $mapper =
      UserDetailsLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UserDetailsLoading $make(CopyWithData data) => UserDetailsLoading();

  @override
  UserDetailsLoadingCopyWith<$R2, UserDetailsLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailsLoadingCopyWithImpl($value, $cast, t);
}

class UserDetailsErrorMapper extends ClassMapperBase<UserDetailsError> {
  UserDetailsErrorMapper._();

  static UserDetailsErrorMapper? _instance;
  static UserDetailsErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsErrorMapper._());
      UserDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsError';

  static String _$message(UserDetailsError v) => v.message;
  static const Field<UserDetailsError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<UserDetailsError> fields = const {
    #message: _f$message,
  };

  static UserDetailsError _instantiate(DecodingData data) {
    return UserDetailsError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsError>(map);
  }

  static UserDetailsError fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsError>(json);
  }
}

mixin UserDetailsErrorMappable {
  String toJson() {
    return UserDetailsErrorMapper.ensureInitialized()
        .encodeJson<UserDetailsError>(this as UserDetailsError);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsErrorMapper.ensureInitialized()
        .encodeMap<UserDetailsError>(this as UserDetailsError);
  }

  UserDetailsErrorCopyWith<UserDetailsError, UserDetailsError, UserDetailsError>
      get copyWith => _UserDetailsErrorCopyWithImpl(
          this as UserDetailsError, $identity, $identity);
  @override
  String toString() {
    return UserDetailsErrorMapper.ensureInitialized()
        .stringifyValue(this as UserDetailsError);
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsErrorMapper.ensureInitialized()
        .equalsValue(this as UserDetailsError, other);
  }

  @override
  int get hashCode {
    return UserDetailsErrorMapper.ensureInitialized()
        .hashValue(this as UserDetailsError);
  }
}

extension UserDetailsErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailsError, $Out> {
  UserDetailsErrorCopyWith<$R, UserDetailsError, $Out>
      get $asUserDetailsError =>
          $base.as((v, t, t2) => _UserDetailsErrorCopyWithImpl(v, t, t2));
}

abstract class UserDetailsErrorCopyWith<$R, $In extends UserDetailsError, $Out>
    implements UserDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  UserDetailsErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserDetailsErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailsError, $Out>
    implements UserDetailsErrorCopyWith<$R, UserDetailsError, $Out> {
  _UserDetailsErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailsError> $mapper =
      UserDetailsErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  UserDetailsError $make(CopyWithData data) =>
      UserDetailsError(message: data.get(#message, or: $value.message));

  @override
  UserDetailsErrorCopyWith<$R2, UserDetailsError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailsErrorCopyWithImpl($value, $cast, t);
}

class FetchedUserDetailsMapper extends ClassMapperBase<FetchedUserDetails> {
  FetchedUserDetailsMapper._();

  static FetchedUserDetailsMapper? _instance;
  static FetchedUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FetchedUserDetailsMapper._());
      UserDetailsStateMapper.ensureInitialized();
      UserDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FetchedUserDetails';

  static UserDetails _$userDetails(FetchedUserDetails v) => v.userDetails;
  static const Field<FetchedUserDetails, UserDetails> _f$userDetails =
      Field('userDetails', _$userDetails);

  @override
  final MappableFields<FetchedUserDetails> fields = const {
    #userDetails: _f$userDetails,
  };

  static FetchedUserDetails _instantiate(DecodingData data) {
    return FetchedUserDetails(userDetails: data.dec(_f$userDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static FetchedUserDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FetchedUserDetails>(map);
  }

  static FetchedUserDetails fromJson(String json) {
    return ensureInitialized().decodeJson<FetchedUserDetails>(json);
  }
}

mixin FetchedUserDetailsMappable {
  String toJson() {
    return FetchedUserDetailsMapper.ensureInitialized()
        .encodeJson<FetchedUserDetails>(this as FetchedUserDetails);
  }

  Map<String, dynamic> toMap() {
    return FetchedUserDetailsMapper.ensureInitialized()
        .encodeMap<FetchedUserDetails>(this as FetchedUserDetails);
  }

  FetchedUserDetailsCopyWith<FetchedUserDetails, FetchedUserDetails,
          FetchedUserDetails>
      get copyWith => _FetchedUserDetailsCopyWithImpl(
          this as FetchedUserDetails, $identity, $identity);
  @override
  String toString() {
    return FetchedUserDetailsMapper.ensureInitialized()
        .stringifyValue(this as FetchedUserDetails);
  }

  @override
  bool operator ==(Object other) {
    return FetchedUserDetailsMapper.ensureInitialized()
        .equalsValue(this as FetchedUserDetails, other);
  }

  @override
  int get hashCode {
    return FetchedUserDetailsMapper.ensureInitialized()
        .hashValue(this as FetchedUserDetails);
  }
}

extension FetchedUserDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FetchedUserDetails, $Out> {
  FetchedUserDetailsCopyWith<$R, FetchedUserDetails, $Out>
      get $asFetchedUserDetails =>
          $base.as((v, t, t2) => _FetchedUserDetailsCopyWithImpl(v, t, t2));
}

abstract class FetchedUserDetailsCopyWith<$R, $In extends FetchedUserDetails,
    $Out> implements UserDetailsStateCopyWith<$R, $In, $Out> {
  UserDetailsCopyWith<$R, UserDetails, UserDetails> get userDetails;
  @override
  $R call({UserDetails? userDetails});
  FetchedUserDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FetchedUserDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FetchedUserDetails, $Out>
    implements FetchedUserDetailsCopyWith<$R, FetchedUserDetails, $Out> {
  _FetchedUserDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FetchedUserDetails> $mapper =
      FetchedUserDetailsMapper.ensureInitialized();
  @override
  UserDetailsCopyWith<$R, UserDetails, UserDetails> get userDetails =>
      $value.userDetails.copyWith.$chain((v) => call(userDetails: v));
  @override
  $R call({UserDetails? userDetails}) => $apply(
      FieldCopyWithData({if (userDetails != null) #userDetails: userDetails}));
  @override
  FetchedUserDetails $make(CopyWithData data) => FetchedUserDetails(
      userDetails: data.get(#userDetails, or: $value.userDetails));

  @override
  FetchedUserDetailsCopyWith<$R2, FetchedUserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FetchedUserDetailsCopyWithImpl($value, $cast, t);
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
