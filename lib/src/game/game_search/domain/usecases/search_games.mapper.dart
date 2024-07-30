// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'search_games.dart';

class SearchGamesParamsMapper extends ClassMapperBase<SearchGamesParams> {
  SearchGamesParamsMapper._();

  static SearchGamesParamsMapper? _instance;
  static SearchGamesParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchGamesParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SearchGamesParams';

  static String _$userToken(SearchGamesParams v) => v.userToken;
  static const Field<SearchGamesParams, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$pageNumber(SearchGamesParams v) => v.pageNumber;
  static const Field<SearchGamesParams, String> _f$pageNumber =
      Field('pageNumber', _$pageNumber);
  static String _$limit(SearchGamesParams v) => v.limit;
  static const Field<SearchGamesParams, String> _f$limit =
      Field('limit', _$limit);
  static String _$field(SearchGamesParams v) => v.field;
  static const Field<SearchGamesParams, String> _f$field =
      Field('field', _$field);
  static String _$query(SearchGamesParams v) => v.query;
  static const Field<SearchGamesParams, String> _f$query =
      Field('query', _$query);

  @override
  final MappableFields<SearchGamesParams> fields = const {
    #userToken: _f$userToken,
    #pageNumber: _f$pageNumber,
    #limit: _f$limit,
    #field: _f$field,
    #query: _f$query,
  };

  static SearchGamesParams _instantiate(DecodingData data) {
    return SearchGamesParams(
        userToken: data.dec(_f$userToken),
        pageNumber: data.dec(_f$pageNumber),
        limit: data.dec(_f$limit),
        field: data.dec(_f$field),
        query: data.dec(_f$query));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchGamesParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchGamesParams>(map);
  }

  static SearchGamesParams fromJson(String json) {
    return ensureInitialized().decodeJson<SearchGamesParams>(json);
  }
}

mixin SearchGamesParamsMappable {
  String toJson() {
    return SearchGamesParamsMapper.ensureInitialized()
        .encodeJson<SearchGamesParams>(this as SearchGamesParams);
  }

  Map<String, dynamic> toMap() {
    return SearchGamesParamsMapper.ensureInitialized()
        .encodeMap<SearchGamesParams>(this as SearchGamesParams);
  }

  SearchGamesParamsCopyWith<SearchGamesParams, SearchGamesParams,
          SearchGamesParams>
      get copyWith => _SearchGamesParamsCopyWithImpl(
          this as SearchGamesParams, $identity, $identity);
  @override
  String toString() {
    return SearchGamesParamsMapper.ensureInitialized()
        .stringifyValue(this as SearchGamesParams);
  }

  @override
  bool operator ==(Object other) {
    return SearchGamesParamsMapper.ensureInitialized()
        .equalsValue(this as SearchGamesParams, other);
  }

  @override
  int get hashCode {
    return SearchGamesParamsMapper.ensureInitialized()
        .hashValue(this as SearchGamesParams);
  }
}

extension SearchGamesParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchGamesParams, $Out> {
  SearchGamesParamsCopyWith<$R, SearchGamesParams, $Out>
      get $asSearchGamesParams =>
          $base.as((v, t, t2) => _SearchGamesParamsCopyWithImpl(v, t, t2));
}

abstract class SearchGamesParamsCopyWith<$R, $In extends SearchGamesParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? userToken,
      String? pageNumber,
      String? limit,
      String? field,
      String? query});
  SearchGamesParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SearchGamesParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchGamesParams, $Out>
    implements SearchGamesParamsCopyWith<$R, SearchGamesParams, $Out> {
  _SearchGamesParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchGamesParams> $mapper =
      SearchGamesParamsMapper.ensureInitialized();
  @override
  $R call(
          {String? userToken,
          String? pageNumber,
          String? limit,
          String? field,
          String? query}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (pageNumber != null) #pageNumber: pageNumber,
        if (limit != null) #limit: limit,
        if (field != null) #field: field,
        if (query != null) #query: query
      }));
  @override
  SearchGamesParams $make(CopyWithData data) => SearchGamesParams(
      userToken: data.get(#userToken, or: $value.userToken),
      pageNumber: data.get(#pageNumber, or: $value.pageNumber),
      limit: data.get(#limit, or: $value.limit),
      field: data.get(#field, or: $value.field),
      query: data.get(#query, or: $value.query));

  @override
  SearchGamesParamsCopyWith<$R2, SearchGamesParams, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchGamesParamsCopyWithImpl($value, $cast, t);
}
