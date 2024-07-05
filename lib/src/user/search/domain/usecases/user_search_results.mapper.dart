// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_search_results.dart';

class UserSearchResultsParamsMapper
    extends ClassMapperBase<UserSearchResultsParams> {
  UserSearchResultsParamsMapper._();

  static UserSearchResultsParamsMapper? _instance;
  static UserSearchResultsParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UserSearchResultsParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchResultsParams';

  static String _$userToken(UserSearchResultsParams v) => v.userToken;
  static const Field<UserSearchResultsParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$pageNumber(UserSearchResultsParams v) => v.pageNumber;
  static const Field<UserSearchResultsParams, String> _f$pageNumber =
      Field('pageNumber', _$pageNumber);
  static String _$limit(UserSearchResultsParams v) => v.limit;
  static const Field<UserSearchResultsParams, String> _f$limit =
      Field('limit', _$limit);
  static String _$field(UserSearchResultsParams v) => v.field;
  static const Field<UserSearchResultsParams, String> _f$field =
      Field('field', _$field);
  static String _$query(UserSearchResultsParams v) => v.query;
  static const Field<UserSearchResultsParams, String> _f$query =
      Field('query', _$query);
  static String _$country(UserSearchResultsParams v) => v.country;
  static const Field<UserSearchResultsParams, String> _f$country =
      Field('country', _$country);
  static String _$accountStatus(UserSearchResultsParams v) => v.accountStatus;
  static const Field<UserSearchResultsParams, String> _f$accountStatus =
      Field('accountStatus', _$accountStatus);

  @override
  final MappableFields<UserSearchResultsParams> fields = const {
    #userToken: _f$userToken,
    #pageNumber: _f$pageNumber,
    #limit: _f$limit,
    #field: _f$field,
    #query: _f$query,
    #country: _f$country,
    #accountStatus: _f$accountStatus,
  };

  static UserSearchResultsParams _instantiate(DecodingData data) {
    return UserSearchResultsParams(
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

  static UserSearchResultsParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchResultsParams>(map);
  }

  static UserSearchResultsParams fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchResultsParams>(json);
  }
}

mixin UserSearchResultsParamsMappable {
  String toJson() {
    return UserSearchResultsParamsMapper.ensureInitialized()
        .encodeJson<UserSearchResultsParams>(this as UserSearchResultsParams);
  }

  Map<String, dynamic> toMap() {
    return UserSearchResultsParamsMapper.ensureInitialized()
        .encodeMap<UserSearchResultsParams>(this as UserSearchResultsParams);
  }

  UserSearchResultsParamsCopyWith<UserSearchResultsParams,
          UserSearchResultsParams, UserSearchResultsParams>
      get copyWith => _UserSearchResultsParamsCopyWithImpl(
          this as UserSearchResultsParams, $identity, $identity);
  @override
  String toString() {
    return UserSearchResultsParamsMapper.ensureInitialized()
        .stringifyValue(this as UserSearchResultsParams);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchResultsParamsMapper.ensureInitialized()
        .equalsValue(this as UserSearchResultsParams, other);
  }

  @override
  int get hashCode {
    return UserSearchResultsParamsMapper.ensureInitialized()
        .hashValue(this as UserSearchResultsParams);
  }
}

extension UserSearchResultsParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchResultsParams, $Out> {
  UserSearchResultsParamsCopyWith<$R, UserSearchResultsParams, $Out>
      get $asUserSearchResultsParams => $base
          .as((v, t, t2) => _UserSearchResultsParamsCopyWithImpl(v, t, t2));
}

abstract class UserSearchResultsParamsCopyWith<
    $R,
    $In extends UserSearchResultsParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? userToken,
      String? pageNumber,
      String? limit,
      String? field,
      String? query,
      String? country,
      String? accountStatus});
  UserSearchResultsParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchResultsParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchResultsParams, $Out>
    implements
        UserSearchResultsParamsCopyWith<$R, UserSearchResultsParams, $Out> {
  _UserSearchResultsParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchResultsParams> $mapper =
      UserSearchResultsParamsMapper.ensureInitialized();
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
  UserSearchResultsParams $make(CopyWithData data) => UserSearchResultsParams(
      userToken: data.get(#userToken, or: $value.userToken),
      pageNumber: data.get(#pageNumber, or: $value.pageNumber),
      limit: data.get(#limit, or: $value.limit),
      field: data.get(#field, or: $value.field),
      query: data.get(#query, or: $value.query),
      country: data.get(#country, or: $value.country),
      accountStatus: data.get(#accountStatus, or: $value.accountStatus));

  @override
  UserSearchResultsParamsCopyWith<$R2, UserSearchResultsParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UserSearchResultsParamsCopyWithImpl($value, $cast, t);
}
