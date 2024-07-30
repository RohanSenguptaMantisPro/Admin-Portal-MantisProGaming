// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_search_response.dart';

class GameSearchResponseMapper extends ClassMapperBase<GameSearchResponse> {
  GameSearchResponseMapper._();

  static GameSearchResponseMapper? _instance;
  static GameSearchResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchResponseMapper._());
      GameDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchResponse';

  static String _$status(GameSearchResponse v) => v.status;
  static const Field<GameSearchResponse, String> _f$status =
      Field('status', _$status);
  static int _$page(GameSearchResponse v) => v.page;
  static const Field<GameSearchResponse, int> _f$page = Field('page', _$page);
  static int _$results(GameSearchResponse v) => v.results;
  static const Field<GameSearchResponse, int> _f$results =
      Field('results', _$results);
  static int _$totalResults(GameSearchResponse v) => v.totalResults;
  static const Field<GameSearchResponse, int> _f$totalResults =
      Field('totalResults', _$totalResults);
  static List<GameData> _$data(GameSearchResponse v) => v.data;
  static const Field<GameSearchResponse, List<GameData>> _f$data =
      Field('data', _$data, opt: true, def: const []);

  @override
  final MappableFields<GameSearchResponse> fields = const {
    #status: _f$status,
    #page: _f$page,
    #results: _f$results,
    #totalResults: _f$totalResults,
    #data: _f$data,
  };

  static GameSearchResponse _instantiate(DecodingData data) {
    return GameSearchResponse(
        status: data.dec(_f$status),
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalResults: data.dec(_f$totalResults),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchResponse>(map);
  }

  static GameSearchResponse fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchResponse>(json);
  }
}

mixin GameSearchResponseMappable {
  String toJson() {
    return GameSearchResponseMapper.ensureInitialized()
        .encodeJson<GameSearchResponse>(this as GameSearchResponse);
  }

  Map<String, dynamic> toMap() {
    return GameSearchResponseMapper.ensureInitialized()
        .encodeMap<GameSearchResponse>(this as GameSearchResponse);
  }

  GameSearchResponseCopyWith<GameSearchResponse, GameSearchResponse,
          GameSearchResponse>
      get copyWith => _GameSearchResponseCopyWithImpl(
          this as GameSearchResponse, $identity, $identity);
  @override
  String toString() {
    return GameSearchResponseMapper.ensureInitialized()
        .stringifyValue(this as GameSearchResponse);
  }

  @override
  bool operator ==(Object other) {
    return GameSearchResponseMapper.ensureInitialized()
        .equalsValue(this as GameSearchResponse, other);
  }

  @override
  int get hashCode {
    return GameSearchResponseMapper.ensureInitialized()
        .hashValue(this as GameSearchResponse);
  }
}

extension GameSearchResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameSearchResponse, $Out> {
  GameSearchResponseCopyWith<$R, GameSearchResponse, $Out>
      get $asGameSearchResponse =>
          $base.as((v, t, t2) => _GameSearchResponseCopyWithImpl(v, t, t2));
}

abstract class GameSearchResponseCopyWith<$R, $In extends GameSearchResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GameData, GameDataCopyWith<$R, GameData, GameData>> get data;
  $R call(
      {String? status,
      int? page,
      int? results,
      int? totalResults,
      List<GameData>? data});
  GameSearchResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameSearchResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameSearchResponse, $Out>
    implements GameSearchResponseCopyWith<$R, GameSearchResponse, $Out> {
  _GameSearchResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameSearchResponse> $mapper =
      GameSearchResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GameData, GameDataCopyWith<$R, GameData, GameData>>
      get data => ListCopyWith(
          $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  $R call(
          {String? status,
          int? page,
          int? results,
          int? totalResults,
          List<GameData>? data}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (page != null) #page: page,
        if (results != null) #results: results,
        if (totalResults != null) #totalResults: totalResults,
        if (data != null) #data: data
      }));
  @override
  GameSearchResponse $make(CopyWithData data) => GameSearchResponse(
      status: data.get(#status, or: $value.status),
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalResults: data.get(#totalResults, or: $value.totalResults),
      data: data.get(#data, or: $value.data));

  @override
  GameSearchResponseCopyWith<$R2, GameSearchResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameSearchResponseCopyWithImpl($value, $cast, t);
}
