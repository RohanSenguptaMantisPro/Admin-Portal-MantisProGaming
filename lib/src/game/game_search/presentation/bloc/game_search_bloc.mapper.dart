// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_search_bloc.dart';

class GameSearchEventMapper extends ClassMapperBase<GameSearchEvent> {
  GameSearchEventMapper._();

  static GameSearchEventMapper? _instance;
  static GameSearchEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchEventMapper._());
      SearchGamesEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchEvent';

  @override
  final MappableFields<GameSearchEvent> fields = const {};

  static GameSearchEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('GameSearchEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchEvent>(map);
  }

  static GameSearchEvent fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchEvent>(json);
  }
}

mixin GameSearchEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GameSearchEventCopyWith<GameSearchEvent, GameSearchEvent, GameSearchEvent>
      get copyWith;
}

abstract class GameSearchEventCopyWith<$R, $In extends GameSearchEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GameSearchEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class SearchGamesEventMapper extends ClassMapperBase<SearchGamesEvent> {
  SearchGamesEventMapper._();

  static SearchGamesEventMapper? _instance;
  static SearchGamesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchGamesEventMapper._());
      GameSearchEventMapper.ensureInitialized();
      SearchGamesParamsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SearchGamesEvent';

  static SearchGamesParams _$searchGamesParams(SearchGamesEvent v) =>
      v.searchGamesParams;
  static const Field<SearchGamesEvent, SearchGamesParams> _f$searchGamesParams =
      Field('searchGamesParams', _$searchGamesParams);

  @override
  final MappableFields<SearchGamesEvent> fields = const {
    #searchGamesParams: _f$searchGamesParams,
  };

  static SearchGamesEvent _instantiate(DecodingData data) {
    return SearchGamesEvent(searchGamesParams: data.dec(_f$searchGamesParams));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchGamesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchGamesEvent>(map);
  }

  static SearchGamesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SearchGamesEvent>(json);
  }
}

mixin SearchGamesEventMappable {
  String toJson() {
    return SearchGamesEventMapper.ensureInitialized()
        .encodeJson<SearchGamesEvent>(this as SearchGamesEvent);
  }

  Map<String, dynamic> toMap() {
    return SearchGamesEventMapper.ensureInitialized()
        .encodeMap<SearchGamesEvent>(this as SearchGamesEvent);
  }

  SearchGamesEventCopyWith<SearchGamesEvent, SearchGamesEvent, SearchGamesEvent>
      get copyWith => _SearchGamesEventCopyWithImpl(
          this as SearchGamesEvent, $identity, $identity);
  @override
  String toString() {
    return SearchGamesEventMapper.ensureInitialized()
        .stringifyValue(this as SearchGamesEvent);
  }

  @override
  bool operator ==(Object other) {
    return SearchGamesEventMapper.ensureInitialized()
        .equalsValue(this as SearchGamesEvent, other);
  }

  @override
  int get hashCode {
    return SearchGamesEventMapper.ensureInitialized()
        .hashValue(this as SearchGamesEvent);
  }
}

extension SearchGamesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchGamesEvent, $Out> {
  SearchGamesEventCopyWith<$R, SearchGamesEvent, $Out>
      get $asSearchGamesEvent =>
          $base.as((v, t, t2) => _SearchGamesEventCopyWithImpl(v, t, t2));
}

abstract class SearchGamesEventCopyWith<$R, $In extends SearchGamesEvent, $Out>
    implements GameSearchEventCopyWith<$R, $In, $Out> {
  SearchGamesParamsCopyWith<$R, SearchGamesParams, SearchGamesParams>
      get searchGamesParams;
  @override
  $R call({SearchGamesParams? searchGamesParams});
  SearchGamesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SearchGamesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchGamesEvent, $Out>
    implements SearchGamesEventCopyWith<$R, SearchGamesEvent, $Out> {
  _SearchGamesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchGamesEvent> $mapper =
      SearchGamesEventMapper.ensureInitialized();
  @override
  SearchGamesParamsCopyWith<$R, SearchGamesParams, SearchGamesParams>
      get searchGamesParams => $value.searchGamesParams.copyWith
          .$chain((v) => call(searchGamesParams: v));
  @override
  $R call({SearchGamesParams? searchGamesParams}) => $apply(FieldCopyWithData(
      {if (searchGamesParams != null) #searchGamesParams: searchGamesParams}));
  @override
  SearchGamesEvent $make(CopyWithData data) => SearchGamesEvent(
      searchGamesParams:
          data.get(#searchGamesParams, or: $value.searchGamesParams));

  @override
  SearchGamesEventCopyWith<$R2, SearchGamesEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchGamesEventCopyWithImpl($value, $cast, t);
}

class GameSearchStateMapper extends ClassMapperBase<GameSearchState> {
  GameSearchStateMapper._();

  static GameSearchStateMapper? _instance;
  static GameSearchStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchStateMapper._());
      GameSearchInitialMapper.ensureInitialized();
      GameSearchLoadingMapper.ensureInitialized();
      GameSearchErrorMapper.ensureInitialized();
      FetchedGameDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchState';

  @override
  final MappableFields<GameSearchState> fields = const {};

  static GameSearchState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('GameSearchState');
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchState>(map);
  }

  static GameSearchState fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchState>(json);
  }
}

mixin GameSearchStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GameSearchStateCopyWith<GameSearchState, GameSearchState, GameSearchState>
      get copyWith;
}

abstract class GameSearchStateCopyWith<$R, $In extends GameSearchState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GameSearchStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class GameSearchInitialMapper extends ClassMapperBase<GameSearchInitial> {
  GameSearchInitialMapper._();

  static GameSearchInitialMapper? _instance;
  static GameSearchInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchInitialMapper._());
      GameSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchInitial';

  @override
  final MappableFields<GameSearchInitial> fields = const {};

  static GameSearchInitial _instantiate(DecodingData data) {
    return GameSearchInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchInitial>(map);
  }

  static GameSearchInitial fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchInitial>(json);
  }
}

mixin GameSearchInitialMappable {
  String toJson() {
    return GameSearchInitialMapper.ensureInitialized()
        .encodeJson<GameSearchInitial>(this as GameSearchInitial);
  }

  Map<String, dynamic> toMap() {
    return GameSearchInitialMapper.ensureInitialized()
        .encodeMap<GameSearchInitial>(this as GameSearchInitial);
  }

  GameSearchInitialCopyWith<GameSearchInitial, GameSearchInitial,
          GameSearchInitial>
      get copyWith => _GameSearchInitialCopyWithImpl(
          this as GameSearchInitial, $identity, $identity);
  @override
  String toString() {
    return GameSearchInitialMapper.ensureInitialized()
        .stringifyValue(this as GameSearchInitial);
  }

  @override
  bool operator ==(Object other) {
    return GameSearchInitialMapper.ensureInitialized()
        .equalsValue(this as GameSearchInitial, other);
  }

  @override
  int get hashCode {
    return GameSearchInitialMapper.ensureInitialized()
        .hashValue(this as GameSearchInitial);
  }
}

extension GameSearchInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameSearchInitial, $Out> {
  GameSearchInitialCopyWith<$R, GameSearchInitial, $Out>
      get $asGameSearchInitial =>
          $base.as((v, t, t2) => _GameSearchInitialCopyWithImpl(v, t, t2));
}

abstract class GameSearchInitialCopyWith<$R, $In extends GameSearchInitial,
    $Out> implements GameSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GameSearchInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameSearchInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameSearchInitial, $Out>
    implements GameSearchInitialCopyWith<$R, GameSearchInitial, $Out> {
  _GameSearchInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameSearchInitial> $mapper =
      GameSearchInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GameSearchInitial $make(CopyWithData data) => GameSearchInitial();

  @override
  GameSearchInitialCopyWith<$R2, GameSearchInitial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameSearchInitialCopyWithImpl($value, $cast, t);
}

class GameSearchLoadingMapper extends ClassMapperBase<GameSearchLoading> {
  GameSearchLoadingMapper._();

  static GameSearchLoadingMapper? _instance;
  static GameSearchLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchLoadingMapper._());
      GameSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchLoading';

  @override
  final MappableFields<GameSearchLoading> fields = const {};

  static GameSearchLoading _instantiate(DecodingData data) {
    return GameSearchLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchLoading>(map);
  }

  static GameSearchLoading fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchLoading>(json);
  }
}

mixin GameSearchLoadingMappable {
  String toJson() {
    return GameSearchLoadingMapper.ensureInitialized()
        .encodeJson<GameSearchLoading>(this as GameSearchLoading);
  }

  Map<String, dynamic> toMap() {
    return GameSearchLoadingMapper.ensureInitialized()
        .encodeMap<GameSearchLoading>(this as GameSearchLoading);
  }

  GameSearchLoadingCopyWith<GameSearchLoading, GameSearchLoading,
          GameSearchLoading>
      get copyWith => _GameSearchLoadingCopyWithImpl(
          this as GameSearchLoading, $identity, $identity);
  @override
  String toString() {
    return GameSearchLoadingMapper.ensureInitialized()
        .stringifyValue(this as GameSearchLoading);
  }

  @override
  bool operator ==(Object other) {
    return GameSearchLoadingMapper.ensureInitialized()
        .equalsValue(this as GameSearchLoading, other);
  }

  @override
  int get hashCode {
    return GameSearchLoadingMapper.ensureInitialized()
        .hashValue(this as GameSearchLoading);
  }
}

extension GameSearchLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameSearchLoading, $Out> {
  GameSearchLoadingCopyWith<$R, GameSearchLoading, $Out>
      get $asGameSearchLoading =>
          $base.as((v, t, t2) => _GameSearchLoadingCopyWithImpl(v, t, t2));
}

abstract class GameSearchLoadingCopyWith<$R, $In extends GameSearchLoading,
    $Out> implements GameSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GameSearchLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameSearchLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameSearchLoading, $Out>
    implements GameSearchLoadingCopyWith<$R, GameSearchLoading, $Out> {
  _GameSearchLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameSearchLoading> $mapper =
      GameSearchLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GameSearchLoading $make(CopyWithData data) => GameSearchLoading();

  @override
  GameSearchLoadingCopyWith<$R2, GameSearchLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameSearchLoadingCopyWithImpl($value, $cast, t);
}

class GameSearchErrorMapper extends ClassMapperBase<GameSearchError> {
  GameSearchErrorMapper._();

  static GameSearchErrorMapper? _instance;
  static GameSearchErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameSearchErrorMapper._());
      GameSearchStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameSearchError';

  static String _$message(GameSearchError v) => v.message;
  static const Field<GameSearchError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<GameSearchError> fields = const {
    #message: _f$message,
  };

  static GameSearchError _instantiate(DecodingData data) {
    return GameSearchError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static GameSearchError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameSearchError>(map);
  }

  static GameSearchError fromJson(String json) {
    return ensureInitialized().decodeJson<GameSearchError>(json);
  }
}

mixin GameSearchErrorMappable {
  String toJson() {
    return GameSearchErrorMapper.ensureInitialized()
        .encodeJson<GameSearchError>(this as GameSearchError);
  }

  Map<String, dynamic> toMap() {
    return GameSearchErrorMapper.ensureInitialized()
        .encodeMap<GameSearchError>(this as GameSearchError);
  }

  GameSearchErrorCopyWith<GameSearchError, GameSearchError, GameSearchError>
      get copyWith => _GameSearchErrorCopyWithImpl(
          this as GameSearchError, $identity, $identity);
  @override
  String toString() {
    return GameSearchErrorMapper.ensureInitialized()
        .stringifyValue(this as GameSearchError);
  }

  @override
  bool operator ==(Object other) {
    return GameSearchErrorMapper.ensureInitialized()
        .equalsValue(this as GameSearchError, other);
  }

  @override
  int get hashCode {
    return GameSearchErrorMapper.ensureInitialized()
        .hashValue(this as GameSearchError);
  }
}

extension GameSearchErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameSearchError, $Out> {
  GameSearchErrorCopyWith<$R, GameSearchError, $Out> get $asGameSearchError =>
      $base.as((v, t, t2) => _GameSearchErrorCopyWithImpl(v, t, t2));
}

abstract class GameSearchErrorCopyWith<$R, $In extends GameSearchError, $Out>
    implements GameSearchStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  GameSearchErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameSearchErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameSearchError, $Out>
    implements GameSearchErrorCopyWith<$R, GameSearchError, $Out> {
  _GameSearchErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameSearchError> $mapper =
      GameSearchErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  GameSearchError $make(CopyWithData data) =>
      GameSearchError(message: data.get(#message, or: $value.message));

  @override
  GameSearchErrorCopyWith<$R2, GameSearchError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameSearchErrorCopyWithImpl($value, $cast, t);
}

class FetchedGameDataMapper extends ClassMapperBase<FetchedGameData> {
  FetchedGameDataMapper._();

  static FetchedGameDataMapper? _instance;
  static FetchedGameDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FetchedGameDataMapper._());
      GameSearchStateMapper.ensureInitialized();
      GameSearchResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FetchedGameData';

  static GameSearchResponse _$gameSearchResponse(FetchedGameData v) =>
      v.gameSearchResponse;
  static const Field<FetchedGameData, GameSearchResponse>
      _f$gameSearchResponse = Field('gameSearchResponse', _$gameSearchResponse);

  @override
  final MappableFields<FetchedGameData> fields = const {
    #gameSearchResponse: _f$gameSearchResponse,
  };

  static FetchedGameData _instantiate(DecodingData data) {
    return FetchedGameData(gameSearchResponse: data.dec(_f$gameSearchResponse));
  }

  @override
  final Function instantiate = _instantiate;

  static FetchedGameData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FetchedGameData>(map);
  }

  static FetchedGameData fromJson(String json) {
    return ensureInitialized().decodeJson<FetchedGameData>(json);
  }
}

mixin FetchedGameDataMappable {
  String toJson() {
    return FetchedGameDataMapper.ensureInitialized()
        .encodeJson<FetchedGameData>(this as FetchedGameData);
  }

  Map<String, dynamic> toMap() {
    return FetchedGameDataMapper.ensureInitialized()
        .encodeMap<FetchedGameData>(this as FetchedGameData);
  }

  FetchedGameDataCopyWith<FetchedGameData, FetchedGameData, FetchedGameData>
      get copyWith => _FetchedGameDataCopyWithImpl(
          this as FetchedGameData, $identity, $identity);
  @override
  String toString() {
    return FetchedGameDataMapper.ensureInitialized()
        .stringifyValue(this as FetchedGameData);
  }

  @override
  bool operator ==(Object other) {
    return FetchedGameDataMapper.ensureInitialized()
        .equalsValue(this as FetchedGameData, other);
  }

  @override
  int get hashCode {
    return FetchedGameDataMapper.ensureInitialized()
        .hashValue(this as FetchedGameData);
  }
}

extension FetchedGameDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FetchedGameData, $Out> {
  FetchedGameDataCopyWith<$R, FetchedGameData, $Out> get $asFetchedGameData =>
      $base.as((v, t, t2) => _FetchedGameDataCopyWithImpl(v, t, t2));
}

abstract class FetchedGameDataCopyWith<$R, $In extends FetchedGameData, $Out>
    implements GameSearchStateCopyWith<$R, $In, $Out> {
  GameSearchResponseCopyWith<$R, GameSearchResponse, GameSearchResponse>
      get gameSearchResponse;
  @override
  $R call({GameSearchResponse? gameSearchResponse});
  FetchedGameDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FetchedGameDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FetchedGameData, $Out>
    implements FetchedGameDataCopyWith<$R, FetchedGameData, $Out> {
  _FetchedGameDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FetchedGameData> $mapper =
      FetchedGameDataMapper.ensureInitialized();
  @override
  GameSearchResponseCopyWith<$R, GameSearchResponse, GameSearchResponse>
      get gameSearchResponse => $value.gameSearchResponse.copyWith
          .$chain((v) => call(gameSearchResponse: v));
  @override
  $R call({GameSearchResponse? gameSearchResponse}) =>
      $apply(FieldCopyWithData({
        if (gameSearchResponse != null) #gameSearchResponse: gameSearchResponse
      }));
  @override
  FetchedGameData $make(CopyWithData data) => FetchedGameData(
      gameSearchResponse:
          data.get(#gameSearchResponse, or: $value.gameSearchResponse));

  @override
  FetchedGameDataCopyWith<$R2, FetchedGameData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FetchedGameDataCopyWithImpl($value, $cast, t);
}
