// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_search_response_model.dart';

class GameSearchResponseModelMapper
    extends SubClassMapperBase<GameSearchResponseModel> {
  GameSearchResponseModelMapper._();

  static GameSearchResponseModelMapper? _instance;
  static GameSearchResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GameSearchResponseModelMapper._());
      GameSearchResponseMapper.ensureInitialized().addSubMapper(_instance!);
      GameDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchResponseModel';

  static String _$status(GameSearchResponseModel v) => v.status;
  static const Field<GameSearchResponseModel, String> _f$status =
      Field('status', _$status);
  static int _$page(GameSearchResponseModel v) => v.page;
  static const Field<GameSearchResponseModel, int> _f$page =
      Field('page', _$page);
  static int _$results(GameSearchResponseModel v) => v.results;
  static const Field<GameSearchResponseModel, int> _f$results =
      Field('results', _$results);
  static int _$totalResults(GameSearchResponseModel v) => v.totalResults;
  static const Field<GameSearchResponseModel, int> _f$totalResults =
      Field('totalResults', _$totalResults);
  static List<GameData> _$data(GameSearchResponseModel v) => v.data;
  static const Field<GameSearchResponseModel, List<GameData>> _f$data =
      Field('data', _$data, def: const []);

  @override
  final MappableFields<GameSearchResponseModel> fields = const {
    #status: _f$status,
    #page: _f$page,
    #results: _f$results,
    #totalResults: _f$totalResults,
    #data: _f$data,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'gameSearchResponseModel';
  @override
  late final ClassMapperBase superMapper =
      GameSearchResponseMapper.ensureInitialized();

  static GameSearchResponseModel _instantiate(DecodingData data) {
    return GameSearchResponseModel(
        status: data.dec(_f$status),
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalResults: data.dec(_f$totalResults),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchResponseModel>(map);
  }

  static GameSearchResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchResponseModel>(json);
  }
}

mixin GameSearchResponseModelMappable {
  String toJson() {
    return GameSearchResponseModelMapper.ensureInitialized()
        .encodeJson<GameSearchResponseModel>(this as GameSearchResponseModel);
  }

  Map<String, dynamic> toMap() {
    return GameSearchResponseModelMapper.ensureInitialized()
        .encodeMap<GameSearchResponseModel>(this as GameSearchResponseModel);
  }

  GameSearchResponseModelCopyWith<GameSearchResponseModel,
          GameSearchResponseModel, GameSearchResponseModel>
      get copyWith => _GameSearchResponseModelCopyWithImpl(
          this as GameSearchResponseModel, $identity, $identity);
  @override
  String toString() {
    return GameSearchResponseModelMapper.ensureInitialized()
        .stringifyValue(this as GameSearchResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return GameSearchResponseModelMapper.ensureInitialized()
        .equalsValue(this as GameSearchResponseModel, other);
  }

  @override
  int get hashCode {
    return GameSearchResponseModelMapper.ensureInitialized()
        .hashValue(this as GameSearchResponseModel);
  }
}

extension GameSearchResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameSearchResponseModel, $Out> {
  GameSearchResponseModelCopyWith<$R, GameSearchResponseModel, $Out>
      get $asGameSearchResponseModel => $base
          .as((v, t, t2) => _GameSearchResponseModelCopyWithImpl(v, t, t2));
}

abstract class GameSearchResponseModelCopyWith<
    $R,
    $In extends GameSearchResponseModel,
    $Out> implements GameSearchResponseCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, GameData, GameDataCopyWith<$R, GameData, GameData>> get data;
  @override
  $R call(
      {String? status,
      int? page,
      int? results,
      int? totalResults,
      List<GameData>? data});
  GameSearchResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameSearchResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameSearchResponseModel, $Out>
    implements
        GameSearchResponseModelCopyWith<$R, GameSearchResponseModel, $Out> {
  _GameSearchResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameSearchResponseModel> $mapper =
      GameSearchResponseModelMapper.ensureInitialized();
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
  GameSearchResponseModel $make(CopyWithData data) => GameSearchResponseModel(
      status: data.get(#status, or: $value.status),
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalResults: data.get(#totalResults, or: $value.totalResults),
      data: data.get(#data, or: $value.data));

  @override
  GameSearchResponseModelCopyWith<$R2, GameSearchResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GameSearchResponseModelCopyWithImpl($value, $cast, t);
}
