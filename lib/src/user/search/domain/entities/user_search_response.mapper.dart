// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_search_response.dart';

class UserSearchResponseMapper extends ClassMapperBase<UserSearchResponse> {
  UserSearchResponseMapper._();

  static UserSearchResponseMapper? _instance;
  static UserSearchResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchResponseMapper._());
      UserDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchResponse';

  static String _$status(UserSearchResponse v) => v.status;
  static const Field<UserSearchResponse, String> _f$status =
      Field('status', _$status);
  static int _$page(UserSearchResponse v) => v.page;
  static const Field<UserSearchResponse, int> _f$page = Field('page', _$page);
  static int _$results(UserSearchResponse v) => v.results;
  static const Field<UserSearchResponse, int> _f$results =
      Field('results', _$results);
  static int _$totalResults(UserSearchResponse v) => v.totalResults;
  static const Field<UserSearchResponse, int> _f$totalResults =
      Field('totalResults', _$totalResults);
  static List<UserData> _$data(UserSearchResponse v) => v.data;
  static const Field<UserSearchResponse, List<UserData>> _f$data =
      Field('data', _$data, opt: true, def: const []);

  @override
  final MappableFields<UserSearchResponse> fields = const {
    #status: _f$status,
    #page: _f$page,
    #results: _f$results,
    #totalResults: _f$totalResults,
    #data: _f$data,
  };

  static UserSearchResponse _instantiate(DecodingData data) {
    return UserSearchResponse(
        status: data.dec(_f$status),
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalResults: data.dec(_f$totalResults),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchResponse>(map);
  }

  static UserSearchResponse fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchResponse>(json);
  }
}

mixin UserSearchResponseMappable {
  String toJson() {
    return UserSearchResponseMapper.ensureInitialized()
        .encodeJson<UserSearchResponse>(this as UserSearchResponse);
  }

  Map<String, dynamic> toMap() {
    return UserSearchResponseMapper.ensureInitialized()
        .encodeMap<UserSearchResponse>(this as UserSearchResponse);
  }

  UserSearchResponseCopyWith<UserSearchResponse, UserSearchResponse,
          UserSearchResponse>
      get copyWith => _UserSearchResponseCopyWithImpl(
          this as UserSearchResponse, $identity, $identity);
  @override
  String toString() {
    return UserSearchResponseMapper.ensureInitialized()
        .stringifyValue(this as UserSearchResponse);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchResponseMapper.ensureInitialized()
        .equalsValue(this as UserSearchResponse, other);
  }

  @override
  int get hashCode {
    return UserSearchResponseMapper.ensureInitialized()
        .hashValue(this as UserSearchResponse);
  }
}

extension UserSearchResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchResponse, $Out> {
  UserSearchResponseCopyWith<$R, UserSearchResponse, $Out>
      get $asUserSearchResponse =>
          $base.as((v, t, t2) => _UserSearchResponseCopyWithImpl(v, t, t2));
}

abstract class UserSearchResponseCopyWith<$R, $In extends UserSearchResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, UserData, UserDataCopyWith<$R, UserData, UserData>> get data;
  $R call(
      {String? status,
      int? page,
      int? results,
      int? totalResults,
      List<UserData>? data});
  UserSearchResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchResponse, $Out>
    implements UserSearchResponseCopyWith<$R, UserSearchResponse, $Out> {
  _UserSearchResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchResponse> $mapper =
      UserSearchResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UserData, UserDataCopyWith<$R, UserData, UserData>>
      get data => ListCopyWith(
          $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  $R call(
          {String? status,
          int? page,
          int? results,
          int? totalResults,
          List<UserData>? data}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (page != null) #page: page,
        if (results != null) #results: results,
        if (totalResults != null) #totalResults: totalResults,
        if (data != null) #data: data
      }));
  @override
  UserSearchResponse $make(CopyWithData data) => UserSearchResponse(
      status: data.get(#status, or: $value.status),
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalResults: data.get(#totalResults, or: $value.totalResults),
      data: data.get(#data, or: $value.data));

  @override
  UserSearchResponseCopyWith<$R2, UserSearchResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchResponseCopyWithImpl($value, $cast, t);
}
