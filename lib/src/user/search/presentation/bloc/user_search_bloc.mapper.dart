// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_search_bloc.dart';

class UserSearchEventMapper extends ClassMapperBase<UserSearchEvent> {
  UserSearchEventMapper._();

  static UserSearchEventMapper? _instance;
  static UserSearchEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchEventMapper._());
      SearchByEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchEvent';

  @override
  final MappableFields<UserSearchEvent> fields = const {};

  static UserSearchEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('UserSearchEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchEvent>(map);
  }

  static UserSearchEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchEvent>(json);
  }
}

mixin UserSearchEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  UserSearchEventCopyWith<UserSearchEvent, UserSearchEvent, UserSearchEvent>
      get copyWith;
}

abstract class UserSearchEventCopyWith<$R, $In extends UserSearchEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UserSearchEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class SearchByEventMapper extends ClassMapperBase<SearchByEvent> {
  SearchByEventMapper._();

  static SearchByEventMapper? _instance;
  static SearchByEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchByEventMapper._());
      UserSearchEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SearchByEvent';

  static String _$userToken(SearchByEvent v) => v.userToken;
  static const Field<SearchByEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$pageNumber(SearchByEvent v) => v.pageNumber;
  static const Field<SearchByEvent, String> _f$pageNumber =
      Field('pageNumber', _$pageNumber);
  static String _$limit(SearchByEvent v) => v.limit;
  static const Field<SearchByEvent, String> _f$limit = Field('limit', _$limit);
  static String _$field(SearchByEvent v) => v.field;
  static const Field<SearchByEvent, String> _f$field = Field('field', _$field);
  static String _$query(SearchByEvent v) => v.query;
  static const Field<SearchByEvent, String> _f$query = Field('query', _$query);
  static String _$country(SearchByEvent v) => v.country;
  static const Field<SearchByEvent, String> _f$country =
      Field('country', _$country);
  static String _$accountStatus(SearchByEvent v) => v.accountStatus;
  static const Field<SearchByEvent, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus);

  @override
  final MappableFields<SearchByEvent> fields = const {
    #userToken: _f$userToken,
    #pageNumber: _f$pageNumber,
    #limit: _f$limit,
    #field: _f$field,
    #query: _f$query,
    #country: _f$country,
    #accountStatus: _f$accountStatus,
  };

  static SearchByEvent _instantiate(DecodingData data) {
    return SearchByEvent(
        userToken: data.dec(_f$userToken),
        pageNumber: data.dec(_f$pageNumber),
        limit: data.dec(_f$limit),
        field: data.dec(_f$field),
        query: data.dec(_f$query),
        country: data.dec(_f$country),
        accountStatus: data.dec(_f$accountStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchByEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchByEvent>(map);
  }

  static SearchByEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SearchByEvent>(json);
  }
}

mixin SearchByEventMappable {
  String toJson() {
    return SearchByEventMapper.ensureInitialized()
        .encodeJson<SearchByEvent>(this as SearchByEvent);
  }

  Map<String, dynamic> toMap() {
    return SearchByEventMapper.ensureInitialized()
        .encodeMap<SearchByEvent>(this as SearchByEvent);
  }

  SearchByEventCopyWith<SearchByEvent, SearchByEvent, SearchByEvent>
      get copyWith => _SearchByEventCopyWithImpl(
          this as SearchByEvent, $identity, $identity);
  @override
  String toString() {
    return SearchByEventMapper.ensureInitialized()
        .stringifyValue(this as SearchByEvent);
  }

  @override
  bool operator ==(Object other) {
    return SearchByEventMapper.ensureInitialized()
        .equalsValue(this as SearchByEvent, other);
  }

  @override
  int get hashCode {
    return SearchByEventMapper.ensureInitialized()
        .hashValue(this as SearchByEvent);
  }
}

extension SearchByEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchByEvent, $Out> {
  SearchByEventCopyWith<$R, SearchByEvent, $Out> get $asSearchByEvent =>
      $base.as((v, t, t2) => _SearchByEventCopyWithImpl(v, t, t2));
}

abstract class SearchByEventCopyWith<$R, $In extends SearchByEvent, $Out>
    implements UserSearchEventCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? userToken,
      String? pageNumber,
      String? limit,
      String? field,
      String? query,
      String? country,
      String? accountStatus});
  SearchByEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SearchByEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchByEvent, $Out>
    implements SearchByEventCopyWith<$R, SearchByEvent, $Out> {
  _SearchByEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchByEvent> $mapper =
      SearchByEventMapper.ensureInitialized();
  @override
  $R call(
          {String? userToken,
          String? pageNumber,
          String? limit,
          String? field,
          String? query,
          String? country,
          String? accountStatus}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (pageNumber != null) #pageNumber: pageNumber,
        if (limit != null) #limit: limit,
        if (field != null) #field: field,
        if (query != null) #query: query,
        if (country != null) #country: country,
        if (accountStatus != null) #accountStatus: accountStatus
      }));
  @override
  SearchByEvent $make(CopyWithData data) => SearchByEvent(
      userToken: data.get(#userToken, or: $value.userToken),
      pageNumber: data.get(#pageNumber, or: $value.pageNumber),
      limit: data.get(#limit, or: $value.limit),
      field: data.get(#field, or: $value.field),
      query: data.get(#query, or: $value.query),
      country: data.get(#country, or: $value.country),
      accountStatus: data.get(#accountStatus, or: $value.accountStatus));

  @override
  SearchByEventCopyWith<$R2, SearchByEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchByEventCopyWithImpl($value, $cast, t);
}

class UserSearchStateMapper extends ClassMapperBase<UserSearchState> {
  UserSearchStateMapper._();

  static UserSearchStateMapper? _instance;
  static UserSearchStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchStateMapper._());
      UserSearchInitialMapper.ensureInitialized();
      UserSearchLoadingMapper.ensureInitialized();
      UserSearchErrorMapper.ensureInitialized();
      FetchedUserDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchState';

  @override
  final MappableFields<UserSearchState> fields = const {};

  static UserSearchState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('UserSearchState');
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchState>(map);
  }

  static UserSearchState fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchState>(json);
  }
}

mixin UserSearchStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  UserSearchStateCopyWith<UserSearchState, UserSearchState, UserSearchState>
      get copyWith;
}

abstract class UserSearchStateCopyWith<$R, $In extends UserSearchState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UserSearchStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class UserSearchInitialMapper extends ClassMapperBase<UserSearchInitial> {
  UserSearchInitialMapper._();

  static UserSearchInitialMapper? _instance;
  static UserSearchInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchInitialMapper._());
      UserSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchInitial';

  @override
  final MappableFields<UserSearchInitial> fields = const {};

  static UserSearchInitial _instantiate(DecodingData data) {
    return UserSearchInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchInitial>(map);
  }

  static UserSearchInitial fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchInitial>(json);
  }
}

mixin UserSearchInitialMappable {
  String toJson() {
    return UserSearchInitialMapper.ensureInitialized()
        .encodeJson<UserSearchInitial>(this as UserSearchInitial);
  }

  Map<String, dynamic> toMap() {
    return UserSearchInitialMapper.ensureInitialized()
        .encodeMap<UserSearchInitial>(this as UserSearchInitial);
  }

  UserSearchInitialCopyWith<UserSearchInitial, UserSearchInitial,
          UserSearchInitial>
      get copyWith => _UserSearchInitialCopyWithImpl(
          this as UserSearchInitial, $identity, $identity);
  @override
  String toString() {
    return UserSearchInitialMapper.ensureInitialized()
        .stringifyValue(this as UserSearchInitial);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchInitialMapper.ensureInitialized()
        .equalsValue(this as UserSearchInitial, other);
  }

  @override
  int get hashCode {
    return UserSearchInitialMapper.ensureInitialized()
        .hashValue(this as UserSearchInitial);
  }
}

extension UserSearchInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchInitial, $Out> {
  UserSearchInitialCopyWith<$R, UserSearchInitial, $Out>
      get $asUserSearchInitial =>
          $base.as((v, t, t2) => _UserSearchInitialCopyWithImpl(v, t, t2));
}

abstract class UserSearchInitialCopyWith<$R, $In extends UserSearchInitial,
    $Out> implements UserSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UserSearchInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchInitial, $Out>
    implements UserSearchInitialCopyWith<$R, UserSearchInitial, $Out> {
  _UserSearchInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchInitial> $mapper =
      UserSearchInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UserSearchInitial $make(CopyWithData data) => UserSearchInitial();

  @override
  UserSearchInitialCopyWith<$R2, UserSearchInitial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchInitialCopyWithImpl($value, $cast, t);
}

class UserSearchLoadingMapper extends ClassMapperBase<UserSearchLoading> {
  UserSearchLoadingMapper._();

  static UserSearchLoadingMapper? _instance;
  static UserSearchLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchLoadingMapper._());
      UserSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchLoading';

  @override
  final MappableFields<UserSearchLoading> fields = const {};

  static UserSearchLoading _instantiate(DecodingData data) {
    return UserSearchLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchLoading>(map);
  }

  static UserSearchLoading fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchLoading>(json);
  }
}

mixin UserSearchLoadingMappable {
  String toJson() {
    return UserSearchLoadingMapper.ensureInitialized()
        .encodeJson<UserSearchLoading>(this as UserSearchLoading);
  }

  Map<String, dynamic> toMap() {
    return UserSearchLoadingMapper.ensureInitialized()
        .encodeMap<UserSearchLoading>(this as UserSearchLoading);
  }

  UserSearchLoadingCopyWith<UserSearchLoading, UserSearchLoading,
          UserSearchLoading>
      get copyWith => _UserSearchLoadingCopyWithImpl(
          this as UserSearchLoading, $identity, $identity);
  @override
  String toString() {
    return UserSearchLoadingMapper.ensureInitialized()
        .stringifyValue(this as UserSearchLoading);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchLoadingMapper.ensureInitialized()
        .equalsValue(this as UserSearchLoading, other);
  }

  @override
  int get hashCode {
    return UserSearchLoadingMapper.ensureInitialized()
        .hashValue(this as UserSearchLoading);
  }
}

extension UserSearchLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchLoading, $Out> {
  UserSearchLoadingCopyWith<$R, UserSearchLoading, $Out>
      get $asUserSearchLoading =>
          $base.as((v, t, t2) => _UserSearchLoadingCopyWithImpl(v, t, t2));
}

abstract class UserSearchLoadingCopyWith<$R, $In extends UserSearchLoading,
    $Out> implements UserSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UserSearchLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchLoading, $Out>
    implements UserSearchLoadingCopyWith<$R, UserSearchLoading, $Out> {
  _UserSearchLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchLoading> $mapper =
      UserSearchLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UserSearchLoading $make(CopyWithData data) => UserSearchLoading();

  @override
  UserSearchLoadingCopyWith<$R2, UserSearchLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchLoadingCopyWithImpl($value, $cast, t);
}

class UserSearchErrorMapper extends ClassMapperBase<UserSearchError> {
  UserSearchErrorMapper._();

  static UserSearchErrorMapper? _instance;
  static UserSearchErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchErrorMapper._());
      UserSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchError';

  static String _$message(UserSearchError v) => v.message;
  static const Field<UserSearchError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<UserSearchError> fields = const {
    #message: _f$message,
  };

  static UserSearchError _instantiate(DecodingData data) {
    return UserSearchError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchError>(map);
  }

  static UserSearchError fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchError>(json);
  }
}

mixin UserSearchErrorMappable {
  String toJson() {
    return UserSearchErrorMapper.ensureInitialized()
        .encodeJson<UserSearchError>(this as UserSearchError);
  }

  Map<String, dynamic> toMap() {
    return UserSearchErrorMapper.ensureInitialized()
        .encodeMap<UserSearchError>(this as UserSearchError);
  }

  UserSearchErrorCopyWith<UserSearchError, UserSearchError, UserSearchError>
      get copyWith => _UserSearchErrorCopyWithImpl(
          this as UserSearchError, $identity, $identity);
  @override
  String toString() {
    return UserSearchErrorMapper.ensureInitialized()
        .stringifyValue(this as UserSearchError);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchErrorMapper.ensureInitialized()
        .equalsValue(this as UserSearchError, other);
  }

  @override
  int get hashCode {
    return UserSearchErrorMapper.ensureInitialized()
        .hashValue(this as UserSearchError);
  }
}

extension UserSearchErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchError, $Out> {
  UserSearchErrorCopyWith<$R, UserSearchError, $Out> get $asUserSearchError =>
      $base.as((v, t, t2) => _UserSearchErrorCopyWithImpl(v, t, t2));
}

abstract class UserSearchErrorCopyWith<$R, $In extends UserSearchError, $Out>
    implements UserSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  UserSearchErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchError, $Out>
    implements UserSearchErrorCopyWith<$R, UserSearchError, $Out> {
  _UserSearchErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchError> $mapper =
      UserSearchErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  UserSearchError $make(CopyWithData data) =>
      UserSearchError(message: data.get(#message, or: $value.message));

  @override
  UserSearchErrorCopyWith<$R2, UserSearchError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchErrorCopyWithImpl($value, $cast, t);
}

class FetchedUserDetailsMapper extends ClassMapperBase<FetchedUserDetails> {
  FetchedUserDetailsMapper._();

  static FetchedUserDetailsMapper? _instance;
  static FetchedUserDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FetchedUserDetailsMapper._());
      UserSearchStateMapper.ensureInitialized();
      UserSearchResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FetchedUserDetails';

  static UserSearchResponse _$userSearchResponse(FetchedUserDetails v) =>
      v.userSearchResponse;
  static const Field<FetchedUserDetails, UserSearchResponse>
      _f$userSearchResponse = Field('userSearchResponse', _$userSearchResponse);

  @override
  final MappableFields<FetchedUserDetails> fields = const {
    #userSearchResponse: _f$userSearchResponse,
  };

  static FetchedUserDetails _instantiate(DecodingData data) {
    return FetchedUserDetails(
        userSearchResponse: data.dec(_f$userSearchResponse));
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
    $Out> implements UserSearchStateCopyWith<$R, $In, $Out> {
  UserSearchResponseCopyWith<$R, UserSearchResponse, UserSearchResponse>
      get userSearchResponse;
  @override
  $R call({UserSearchResponse? userSearchResponse});
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
  UserSearchResponseCopyWith<$R, UserSearchResponse, UserSearchResponse>
      get userSearchResponse => $value.userSearchResponse.copyWith
          .$chain((v) => call(userSearchResponse: v));
  @override
  $R call({UserSearchResponse? userSearchResponse}) =>
      $apply(FieldCopyWithData({
        if (userSearchResponse != null) #userSearchResponse: userSearchResponse
      }));
  @override
  FetchedUserDetails $make(CopyWithData data) => FetchedUserDetails(
      userSearchResponse:
          data.get(#userSearchResponse, or: $value.userSearchResponse));

  @override
  FetchedUserDetailsCopyWith<$R2, FetchedUserDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FetchedUserDetailsCopyWithImpl($value, $cast, t);
}
