// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_details_bloc.dart';

class GameDetailsEventMapper extends ClassMapperBase<GameDetailsEvent> {
  GameDetailsEventMapper._();

  static GameDetailsEventMapper? _instance;
  static GameDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsEventMapper._());
      GetGameDetailsEventMapper.ensureInitialized();
      UpdateGameDetailsEventMapper.ensureInitialized();
      DownloadGameImagesEventMapper.ensureInitialized();
      UploadGameImagesEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsEvent';

  @override
  final MappableFields<GameDetailsEvent> fields = const {};

  static GameDetailsEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('GameDetailsEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsEvent>(map);
  }

  static GameDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsEvent>(json);
  }
}

mixin GameDetailsEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GameDetailsEventCopyWith<GameDetailsEvent, GameDetailsEvent, GameDetailsEvent>
      get copyWith;
}

abstract class GameDetailsEventCopyWith<$R, $In extends GameDetailsEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GameDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class GetGameDetailsEventMapper extends ClassMapperBase<GetGameDetailsEvent> {
  GetGameDetailsEventMapper._();

  static GetGameDetailsEventMapper? _instance;
  static GetGameDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetGameDetailsEventMapper._());
      GameDetailsEventMapper.ensureInitialized();
      GetGameDetailsParamsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GetGameDetailsEvent';

  static GetGameDetailsParams _$getGameDetailsParams(GetGameDetailsEvent v) =>
      v.getGameDetailsParams;
  static const Field<GetGameDetailsEvent, GetGameDetailsParams>
      _f$getGameDetailsParams =
      Field('getGameDetailsParams', _$getGameDetailsParams);

  @override
  final MappableFields<GetGameDetailsEvent> fields = const {
    #getGameDetailsParams: _f$getGameDetailsParams,
  };

  static GetGameDetailsEvent _instantiate(DecodingData data) {
    return GetGameDetailsEvent(
        getGameDetailsParams: data.dec(_f$getGameDetailsParams));
  }

  @override
  final Function instantiate = _instantiate;

  static GetGameDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetGameDetailsEvent>(map);
  }

  static GetGameDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<GetGameDetailsEvent>(json);
  }
}

mixin GetGameDetailsEventMappable {
  String toJson() {
    return GetGameDetailsEventMapper.ensureInitialized()
        .encodeJson<GetGameDetailsEvent>(this as GetGameDetailsEvent);
  }

  Map<String, dynamic> toMap() {
    return GetGameDetailsEventMapper.ensureInitialized()
        .encodeMap<GetGameDetailsEvent>(this as GetGameDetailsEvent);
  }

  GetGameDetailsEventCopyWith<GetGameDetailsEvent, GetGameDetailsEvent,
          GetGameDetailsEvent>
      get copyWith => _GetGameDetailsEventCopyWithImpl(
          this as GetGameDetailsEvent, $identity, $identity);
  @override
  String toString() {
    return GetGameDetailsEventMapper.ensureInitialized()
        .stringifyValue(this as GetGameDetailsEvent);
  }

  @override
  bool operator ==(Object other) {
    return GetGameDetailsEventMapper.ensureInitialized()
        .equalsValue(this as GetGameDetailsEvent, other);
  }

  @override
  int get hashCode {
    return GetGameDetailsEventMapper.ensureInitialized()
        .hashValue(this as GetGameDetailsEvent);
  }
}

extension GetGameDetailsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetGameDetailsEvent, $Out> {
  GetGameDetailsEventCopyWith<$R, GetGameDetailsEvent, $Out>
      get $asGetGameDetailsEvent =>
          $base.as((v, t, t2) => _GetGameDetailsEventCopyWithImpl(v, t, t2));
}

abstract class GetGameDetailsEventCopyWith<$R, $In extends GetGameDetailsEvent,
    $Out> implements GameDetailsEventCopyWith<$R, $In, $Out> {
  GetGameDetailsParamsCopyWith<$R, GetGameDetailsParams, GetGameDetailsParams>
      get getGameDetailsParams;
  @override
  $R call({GetGameDetailsParams? getGameDetailsParams});
  GetGameDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetGameDetailsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetGameDetailsEvent, $Out>
    implements GetGameDetailsEventCopyWith<$R, GetGameDetailsEvent, $Out> {
  _GetGameDetailsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetGameDetailsEvent> $mapper =
      GetGameDetailsEventMapper.ensureInitialized();
  @override
  GetGameDetailsParamsCopyWith<$R, GetGameDetailsParams, GetGameDetailsParams>
      get getGameDetailsParams => $value.getGameDetailsParams.copyWith
          .$chain((v) => call(getGameDetailsParams: v));
  @override
  $R call({GetGameDetailsParams? getGameDetailsParams}) =>
      $apply(FieldCopyWithData({
        if (getGameDetailsParams != null)
          #getGameDetailsParams: getGameDetailsParams
      }));
  @override
  GetGameDetailsEvent $make(CopyWithData data) => GetGameDetailsEvent(
      getGameDetailsParams:
          data.get(#getGameDetailsParams, or: $value.getGameDetailsParams));

  @override
  GetGameDetailsEventCopyWith<$R2, GetGameDetailsEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetGameDetailsEventCopyWithImpl($value, $cast, t);
}

class UpdateGameDetailsEventMapper
    extends ClassMapperBase<UpdateGameDetailsEvent> {
  UpdateGameDetailsEventMapper._();

  static UpdateGameDetailsEventMapper? _instance;
  static UpdateGameDetailsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateGameDetailsEventMapper._());
      GameDetailsEventMapper.ensureInitialized();
      UpdateGameDetailsParamsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateGameDetailsEvent';

  static UpdateGameDetailsParams _$updateGameDetailsParams(
          UpdateGameDetailsEvent v) =>
      v.updateGameDetailsParams;
  static const Field<UpdateGameDetailsEvent, UpdateGameDetailsParams>
      _f$updateGameDetailsParams =
      Field('updateGameDetailsParams', _$updateGameDetailsParams);

  @override
  final MappableFields<UpdateGameDetailsEvent> fields = const {
    #updateGameDetailsParams: _f$updateGameDetailsParams,
  };

  static UpdateGameDetailsEvent _instantiate(DecodingData data) {
    return UpdateGameDetailsEvent(
        updateGameDetailsParams: data.dec(_f$updateGameDetailsParams));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateGameDetailsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateGameDetailsEvent>(map);
  }

  static UpdateGameDetailsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateGameDetailsEvent>(json);
  }
}

mixin UpdateGameDetailsEventMappable {
  String toJson() {
    return UpdateGameDetailsEventMapper.ensureInitialized()
        .encodeJson<UpdateGameDetailsEvent>(this as UpdateGameDetailsEvent);
  }

  Map<String, dynamic> toMap() {
    return UpdateGameDetailsEventMapper.ensureInitialized()
        .encodeMap<UpdateGameDetailsEvent>(this as UpdateGameDetailsEvent);
  }

  UpdateGameDetailsEventCopyWith<UpdateGameDetailsEvent, UpdateGameDetailsEvent,
          UpdateGameDetailsEvent>
      get copyWith => _UpdateGameDetailsEventCopyWithImpl(
          this as UpdateGameDetailsEvent, $identity, $identity);
  @override
  String toString() {
    return UpdateGameDetailsEventMapper.ensureInitialized()
        .stringifyValue(this as UpdateGameDetailsEvent);
  }

  @override
  bool operator ==(Object other) {
    return UpdateGameDetailsEventMapper.ensureInitialized()
        .equalsValue(this as UpdateGameDetailsEvent, other);
  }

  @override
  int get hashCode {
    return UpdateGameDetailsEventMapper.ensureInitialized()
        .hashValue(this as UpdateGameDetailsEvent);
  }
}

extension UpdateGameDetailsEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateGameDetailsEvent, $Out> {
  UpdateGameDetailsEventCopyWith<$R, UpdateGameDetailsEvent, $Out>
      get $asUpdateGameDetailsEvent =>
          $base.as((v, t, t2) => _UpdateGameDetailsEventCopyWithImpl(v, t, t2));
}

abstract class UpdateGameDetailsEventCopyWith<
    $R,
    $In extends UpdateGameDetailsEvent,
    $Out> implements GameDetailsEventCopyWith<$R, $In, $Out> {
  UpdateGameDetailsParamsCopyWith<$R, UpdateGameDetailsParams,
      UpdateGameDetailsParams> get updateGameDetailsParams;
  @override
  $R call({UpdateGameDetailsParams? updateGameDetailsParams});
  UpdateGameDetailsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateGameDetailsEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateGameDetailsEvent, $Out>
    implements
        UpdateGameDetailsEventCopyWith<$R, UpdateGameDetailsEvent, $Out> {
  _UpdateGameDetailsEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateGameDetailsEvent> $mapper =
      UpdateGameDetailsEventMapper.ensureInitialized();
  @override
  UpdateGameDetailsParamsCopyWith<$R, UpdateGameDetailsParams,
          UpdateGameDetailsParams>
      get updateGameDetailsParams => $value.updateGameDetailsParams.copyWith
          .$chain((v) => call(updateGameDetailsParams: v));
  @override
  $R call({UpdateGameDetailsParams? updateGameDetailsParams}) =>
      $apply(FieldCopyWithData({
        if (updateGameDetailsParams != null)
          #updateGameDetailsParams: updateGameDetailsParams
      }));
  @override
  UpdateGameDetailsEvent $make(CopyWithData data) => UpdateGameDetailsEvent(
      updateGameDetailsParams: data.get(#updateGameDetailsParams,
          or: $value.updateGameDetailsParams));

  @override
  UpdateGameDetailsEventCopyWith<$R2, UpdateGameDetailsEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateGameDetailsEventCopyWithImpl($value, $cast, t);
}

class DownloadGameImagesEventMapper
    extends ClassMapperBase<DownloadGameImagesEvent> {
  DownloadGameImagesEventMapper._();

  static DownloadGameImagesEventMapper? _instance;
  static DownloadGameImagesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownloadGameImagesEventMapper._());
      GameDetailsEventMapper.ensureInitialized();
      DownloadGameImagesParamsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadGameImagesEvent';

  static DownloadGameImagesParams _$downloadGameImagesParams(
          DownloadGameImagesEvent v) =>
      v.downloadGameImagesParams;
  static const Field<DownloadGameImagesEvent, DownloadGameImagesParams>
      _f$downloadGameImagesParams =
      Field('downloadGameImagesParams', _$downloadGameImagesParams);
  static GameImageType _$imageType(DownloadGameImagesEvent v) => v.imageType;
  static const Field<DownloadGameImagesEvent, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<DownloadGameImagesEvent> fields = const {
    #downloadGameImagesParams: _f$downloadGameImagesParams,
    #imageType: _f$imageType,
  };

  static DownloadGameImagesEvent _instantiate(DecodingData data) {
    return DownloadGameImagesEvent(
        downloadGameImagesParams: data.dec(_f$downloadGameImagesParams),
        imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadGameImagesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadGameImagesEvent>(map);
  }

  static DownloadGameImagesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadGameImagesEvent>(json);
  }
}

mixin DownloadGameImagesEventMappable {
  String toJson() {
    return DownloadGameImagesEventMapper.ensureInitialized()
        .encodeJson<DownloadGameImagesEvent>(this as DownloadGameImagesEvent);
  }

  Map<String, dynamic> toMap() {
    return DownloadGameImagesEventMapper.ensureInitialized()
        .encodeMap<DownloadGameImagesEvent>(this as DownloadGameImagesEvent);
  }

  DownloadGameImagesEventCopyWith<DownloadGameImagesEvent,
          DownloadGameImagesEvent, DownloadGameImagesEvent>
      get copyWith => _DownloadGameImagesEventCopyWithImpl(
          this as DownloadGameImagesEvent, $identity, $identity);
  @override
  String toString() {
    return DownloadGameImagesEventMapper.ensureInitialized()
        .stringifyValue(this as DownloadGameImagesEvent);
  }

  @override
  bool operator ==(Object other) {
    return DownloadGameImagesEventMapper.ensureInitialized()
        .equalsValue(this as DownloadGameImagesEvent, other);
  }

  @override
  int get hashCode {
    return DownloadGameImagesEventMapper.ensureInitialized()
        .hashValue(this as DownloadGameImagesEvent);
  }
}

extension DownloadGameImagesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadGameImagesEvent, $Out> {
  DownloadGameImagesEventCopyWith<$R, DownloadGameImagesEvent, $Out>
      get $asDownloadGameImagesEvent => $base
          .as((v, t, t2) => _DownloadGameImagesEventCopyWithImpl(v, t, t2));
}

abstract class DownloadGameImagesEventCopyWith<
    $R,
    $In extends DownloadGameImagesEvent,
    $Out> implements GameDetailsEventCopyWith<$R, $In, $Out> {
  DownloadGameImagesParamsCopyWith<$R, DownloadGameImagesParams,
      DownloadGameImagesParams> get downloadGameImagesParams;
  @override
  $R call(
      {DownloadGameImagesParams? downloadGameImagesParams,
      GameImageType? imageType});
  DownloadGameImagesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadGameImagesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadGameImagesEvent, $Out>
    implements
        DownloadGameImagesEventCopyWith<$R, DownloadGameImagesEvent, $Out> {
  _DownloadGameImagesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadGameImagesEvent> $mapper =
      DownloadGameImagesEventMapper.ensureInitialized();
  @override
  DownloadGameImagesParamsCopyWith<$R, DownloadGameImagesParams,
          DownloadGameImagesParams>
      get downloadGameImagesParams => $value.downloadGameImagesParams.copyWith
          .$chain((v) => call(downloadGameImagesParams: v));
  @override
  $R call(
          {DownloadGameImagesParams? downloadGameImagesParams,
          GameImageType? imageType}) =>
      $apply(FieldCopyWithData({
        if (downloadGameImagesParams != null)
          #downloadGameImagesParams: downloadGameImagesParams,
        if (imageType != null) #imageType: imageType
      }));
  @override
  DownloadGameImagesEvent $make(CopyWithData data) => DownloadGameImagesEvent(
      downloadGameImagesParams: data.get(#downloadGameImagesParams,
          or: $value.downloadGameImagesParams),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  DownloadGameImagesEventCopyWith<$R2, DownloadGameImagesEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadGameImagesEventCopyWithImpl($value, $cast, t);
}

class UploadGameImagesEventMapper
    extends ClassMapperBase<UploadGameImagesEvent> {
  UploadGameImagesEventMapper._();

  static UploadGameImagesEventMapper? _instance;
  static UploadGameImagesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadGameImagesEventMapper._());
      GameDetailsEventMapper.ensureInitialized();
      UploadGameImagesParamsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadGameImagesEvent';

  static UploadGameImagesParams _$uploadGameImagesParams(
          UploadGameImagesEvent v) =>
      v.uploadGameImagesParams;
  static const Field<UploadGameImagesEvent, UploadGameImagesParams>
      _f$uploadGameImagesParams =
      Field('uploadGameImagesParams', _$uploadGameImagesParams);
  static GameImageType _$imageType(UploadGameImagesEvent v) => v.imageType;
  static const Field<UploadGameImagesEvent, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<UploadGameImagesEvent> fields = const {
    #uploadGameImagesParams: _f$uploadGameImagesParams,
    #imageType: _f$imageType,
  };

  static UploadGameImagesEvent _instantiate(DecodingData data) {
    return UploadGameImagesEvent(
        uploadGameImagesParams: data.dec(_f$uploadGameImagesParams),
        imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadGameImagesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadGameImagesEvent>(map);
  }

  static UploadGameImagesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UploadGameImagesEvent>(json);
  }
}

mixin UploadGameImagesEventMappable {
  String toJson() {
    return UploadGameImagesEventMapper.ensureInitialized()
        .encodeJson<UploadGameImagesEvent>(this as UploadGameImagesEvent);
  }

  Map<String, dynamic> toMap() {
    return UploadGameImagesEventMapper.ensureInitialized()
        .encodeMap<UploadGameImagesEvent>(this as UploadGameImagesEvent);
  }

  UploadGameImagesEventCopyWith<UploadGameImagesEvent, UploadGameImagesEvent,
          UploadGameImagesEvent>
      get copyWith => _UploadGameImagesEventCopyWithImpl(
          this as UploadGameImagesEvent, $identity, $identity);
  @override
  String toString() {
    return UploadGameImagesEventMapper.ensureInitialized()
        .stringifyValue(this as UploadGameImagesEvent);
  }

  @override
  bool operator ==(Object other) {
    return UploadGameImagesEventMapper.ensureInitialized()
        .equalsValue(this as UploadGameImagesEvent, other);
  }

  @override
  int get hashCode {
    return UploadGameImagesEventMapper.ensureInitialized()
        .hashValue(this as UploadGameImagesEvent);
  }
}

extension UploadGameImagesEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadGameImagesEvent, $Out> {
  UploadGameImagesEventCopyWith<$R, UploadGameImagesEvent, $Out>
      get $asUploadGameImagesEvent =>
          $base.as((v, t, t2) => _UploadGameImagesEventCopyWithImpl(v, t, t2));
}

abstract class UploadGameImagesEventCopyWith<
    $R,
    $In extends UploadGameImagesEvent,
    $Out> implements GameDetailsEventCopyWith<$R, $In, $Out> {
  UploadGameImagesParamsCopyWith<$R, UploadGameImagesParams,
      UploadGameImagesParams> get uploadGameImagesParams;
  @override
  $R call(
      {UploadGameImagesParams? uploadGameImagesParams,
      GameImageType? imageType});
  UploadGameImagesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadGameImagesEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadGameImagesEvent, $Out>
    implements UploadGameImagesEventCopyWith<$R, UploadGameImagesEvent, $Out> {
  _UploadGameImagesEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadGameImagesEvent> $mapper =
      UploadGameImagesEventMapper.ensureInitialized();
  @override
  UploadGameImagesParamsCopyWith<$R, UploadGameImagesParams,
          UploadGameImagesParams>
      get uploadGameImagesParams => $value.uploadGameImagesParams.copyWith
          .$chain((v) => call(uploadGameImagesParams: v));
  @override
  $R call(
          {UploadGameImagesParams? uploadGameImagesParams,
          GameImageType? imageType}) =>
      $apply(FieldCopyWithData({
        if (uploadGameImagesParams != null)
          #uploadGameImagesParams: uploadGameImagesParams,
        if (imageType != null) #imageType: imageType
      }));
  @override
  UploadGameImagesEvent $make(CopyWithData data) => UploadGameImagesEvent(
      uploadGameImagesParams:
          data.get(#uploadGameImagesParams, or: $value.uploadGameImagesParams),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  UploadGameImagesEventCopyWith<$R2, UploadGameImagesEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UploadGameImagesEventCopyWithImpl($value, $cast, t);
}

class GameDetailsStateMapper extends ClassMapperBase<GameDetailsState> {
  GameDetailsStateMapper._();

  static GameDetailsStateMapper? _instance;
  static GameDetailsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsStateMapper._());
      GameDetailsInitialMapper.ensureInitialized();
      GettingGameDetailsMapper.ensureInitialized();
      UpdatingGameDetailsMapper.ensureInitialized();
      GotGameDetailsMapper.ensureInitialized();
      UpdatedGameDetailsMapper.ensureInitialized();
      DownloadingGameImageMapper.ensureInitialized();
      DownloadedGameImageMapper.ensureInitialized();
      UploadingGameImageMapper.ensureInitialized();
      UploadedGameImageMapper.ensureInitialized();
      GameDetailsErrorMapper.ensureInitialized();
      GameImageErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsState';

  @override
  final MappableFields<GameDetailsState> fields = const {};

  static GameDetailsState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('GameDetailsState');
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsState>(map);
  }

  static GameDetailsState fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsState>(json);
  }
}

mixin GameDetailsStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  GameDetailsStateCopyWith<GameDetailsState, GameDetailsState, GameDetailsState>
      get copyWith;
}

abstract class GameDetailsStateCopyWith<$R, $In extends GameDetailsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  GameDetailsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class GameDetailsInitialMapper extends ClassMapperBase<GameDetailsInitial> {
  GameDetailsInitialMapper._();

  static GameDetailsInitialMapper? _instance;
  static GameDetailsInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsInitialMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsInitial';

  @override
  final MappableFields<GameDetailsInitial> fields = const {};

  static GameDetailsInitial _instantiate(DecodingData data) {
    return GameDetailsInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsInitial>(map);
  }

  static GameDetailsInitial fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsInitial>(json);
  }
}

mixin GameDetailsInitialMappable {
  String toJson() {
    return GameDetailsInitialMapper.ensureInitialized()
        .encodeJson<GameDetailsInitial>(this as GameDetailsInitial);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsInitialMapper.ensureInitialized()
        .encodeMap<GameDetailsInitial>(this as GameDetailsInitial);
  }

  GameDetailsInitialCopyWith<GameDetailsInitial, GameDetailsInitial,
          GameDetailsInitial>
      get copyWith => _GameDetailsInitialCopyWithImpl(
          this as GameDetailsInitial, $identity, $identity);
  @override
  String toString() {
    return GameDetailsInitialMapper.ensureInitialized()
        .stringifyValue(this as GameDetailsInitial);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsInitialMapper.ensureInitialized()
        .equalsValue(this as GameDetailsInitial, other);
  }

  @override
  int get hashCode {
    return GameDetailsInitialMapper.ensureInitialized()
        .hashValue(this as GameDetailsInitial);
  }
}

extension GameDetailsInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetailsInitial, $Out> {
  GameDetailsInitialCopyWith<$R, GameDetailsInitial, $Out>
      get $asGameDetailsInitial =>
          $base.as((v, t, t2) => _GameDetailsInitialCopyWithImpl(v, t, t2));
}

abstract class GameDetailsInitialCopyWith<$R, $In extends GameDetailsInitial,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GameDetailsInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameDetailsInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetailsInitial, $Out>
    implements GameDetailsInitialCopyWith<$R, GameDetailsInitial, $Out> {
  _GameDetailsInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetailsInitial> $mapper =
      GameDetailsInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GameDetailsInitial $make(CopyWithData data) => GameDetailsInitial();

  @override
  GameDetailsInitialCopyWith<$R2, GameDetailsInitial, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDetailsInitialCopyWithImpl($value, $cast, t);
}

class GettingGameDetailsMapper extends ClassMapperBase<GettingGameDetails> {
  GettingGameDetailsMapper._();

  static GettingGameDetailsMapper? _instance;
  static GettingGameDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GettingGameDetailsMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GettingGameDetails';

  @override
  final MappableFields<GettingGameDetails> fields = const {};

  static GettingGameDetails _instantiate(DecodingData data) {
    return GettingGameDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static GettingGameDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GettingGameDetails>(map);
  }

  static GettingGameDetails fromJson(String json) {
    return ensureInitialized().decodeJson<GettingGameDetails>(json);
  }
}

mixin GettingGameDetailsMappable {
  String toJson() {
    return GettingGameDetailsMapper.ensureInitialized()
        .encodeJson<GettingGameDetails>(this as GettingGameDetails);
  }

  Map<String, dynamic> toMap() {
    return GettingGameDetailsMapper.ensureInitialized()
        .encodeMap<GettingGameDetails>(this as GettingGameDetails);
  }

  GettingGameDetailsCopyWith<GettingGameDetails, GettingGameDetails,
          GettingGameDetails>
      get copyWith => _GettingGameDetailsCopyWithImpl(
          this as GettingGameDetails, $identity, $identity);
  @override
  String toString() {
    return GettingGameDetailsMapper.ensureInitialized()
        .stringifyValue(this as GettingGameDetails);
  }

  @override
  bool operator ==(Object other) {
    return GettingGameDetailsMapper.ensureInitialized()
        .equalsValue(this as GettingGameDetails, other);
  }

  @override
  int get hashCode {
    return GettingGameDetailsMapper.ensureInitialized()
        .hashValue(this as GettingGameDetails);
  }
}

extension GettingGameDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GettingGameDetails, $Out> {
  GettingGameDetailsCopyWith<$R, GettingGameDetails, $Out>
      get $asGettingGameDetails =>
          $base.as((v, t, t2) => _GettingGameDetailsCopyWithImpl(v, t, t2));
}

abstract class GettingGameDetailsCopyWith<$R, $In extends GettingGameDetails,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GettingGameDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GettingGameDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GettingGameDetails, $Out>
    implements GettingGameDetailsCopyWith<$R, GettingGameDetails, $Out> {
  _GettingGameDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GettingGameDetails> $mapper =
      GettingGameDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GettingGameDetails $make(CopyWithData data) => GettingGameDetails();

  @override
  GettingGameDetailsCopyWith<$R2, GettingGameDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GettingGameDetailsCopyWithImpl($value, $cast, t);
}

class UpdatingGameDetailsMapper extends ClassMapperBase<UpdatingGameDetails> {
  UpdatingGameDetailsMapper._();

  static UpdatingGameDetailsMapper? _instance;
  static UpdatingGameDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdatingGameDetailsMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdatingGameDetails';

  @override
  final MappableFields<UpdatingGameDetails> fields = const {};

  static UpdatingGameDetails _instantiate(DecodingData data) {
    return UpdatingGameDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static UpdatingGameDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdatingGameDetails>(map);
  }

  static UpdatingGameDetails fromJson(String json) {
    return ensureInitialized().decodeJson<UpdatingGameDetails>(json);
  }
}

mixin UpdatingGameDetailsMappable {
  String toJson() {
    return UpdatingGameDetailsMapper.ensureInitialized()
        .encodeJson<UpdatingGameDetails>(this as UpdatingGameDetails);
  }

  Map<String, dynamic> toMap() {
    return UpdatingGameDetailsMapper.ensureInitialized()
        .encodeMap<UpdatingGameDetails>(this as UpdatingGameDetails);
  }

  UpdatingGameDetailsCopyWith<UpdatingGameDetails, UpdatingGameDetails,
          UpdatingGameDetails>
      get copyWith => _UpdatingGameDetailsCopyWithImpl(
          this as UpdatingGameDetails, $identity, $identity);
  @override
  String toString() {
    return UpdatingGameDetailsMapper.ensureInitialized()
        .stringifyValue(this as UpdatingGameDetails);
  }

  @override
  bool operator ==(Object other) {
    return UpdatingGameDetailsMapper.ensureInitialized()
        .equalsValue(this as UpdatingGameDetails, other);
  }

  @override
  int get hashCode {
    return UpdatingGameDetailsMapper.ensureInitialized()
        .hashValue(this as UpdatingGameDetails);
  }
}

extension UpdatingGameDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdatingGameDetails, $Out> {
  UpdatingGameDetailsCopyWith<$R, UpdatingGameDetails, $Out>
      get $asUpdatingGameDetails =>
          $base.as((v, t, t2) => _UpdatingGameDetailsCopyWithImpl(v, t, t2));
}

abstract class UpdatingGameDetailsCopyWith<$R, $In extends UpdatingGameDetails,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UpdatingGameDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdatingGameDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdatingGameDetails, $Out>
    implements UpdatingGameDetailsCopyWith<$R, UpdatingGameDetails, $Out> {
  _UpdatingGameDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdatingGameDetails> $mapper =
      UpdatingGameDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UpdatingGameDetails $make(CopyWithData data) => UpdatingGameDetails();

  @override
  UpdatingGameDetailsCopyWith<$R2, UpdatingGameDetails, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdatingGameDetailsCopyWithImpl($value, $cast, t);
}

class GotGameDetailsMapper extends ClassMapperBase<GotGameDetails> {
  GotGameDetailsMapper._();

  static GotGameDetailsMapper? _instance;
  static GotGameDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GotGameDetailsMapper._());
      GameDetailsStateMapper.ensureInitialized();
      GameDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GotGameDetails';

  static GameDetails _$gameDetails(GotGameDetails v) => v.gameDetails;
  static const Field<GotGameDetails, GameDetails> _f$gameDetails =
      Field('gameDetails', _$gameDetails);

  @override
  final MappableFields<GotGameDetails> fields = const {
    #gameDetails: _f$gameDetails,
  };

  static GotGameDetails _instantiate(DecodingData data) {
    return GotGameDetails(gameDetails: data.dec(_f$gameDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static GotGameDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GotGameDetails>(map);
  }

  static GotGameDetails fromJson(String json) {
    return ensureInitialized().decodeJson<GotGameDetails>(json);
  }
}

mixin GotGameDetailsMappable {
  String toJson() {
    return GotGameDetailsMapper.ensureInitialized()
        .encodeJson<GotGameDetails>(this as GotGameDetails);
  }

  Map<String, dynamic> toMap() {
    return GotGameDetailsMapper.ensureInitialized()
        .encodeMap<GotGameDetails>(this as GotGameDetails);
  }

  GotGameDetailsCopyWith<GotGameDetails, GotGameDetails, GotGameDetails>
      get copyWith => _GotGameDetailsCopyWithImpl(
          this as GotGameDetails, $identity, $identity);
  @override
  String toString() {
    return GotGameDetailsMapper.ensureInitialized()
        .stringifyValue(this as GotGameDetails);
  }

  @override
  bool operator ==(Object other) {
    return GotGameDetailsMapper.ensureInitialized()
        .equalsValue(this as GotGameDetails, other);
  }

  @override
  int get hashCode {
    return GotGameDetailsMapper.ensureInitialized()
        .hashValue(this as GotGameDetails);
  }
}

extension GotGameDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GotGameDetails, $Out> {
  GotGameDetailsCopyWith<$R, GotGameDetails, $Out> get $asGotGameDetails =>
      $base.as((v, t, t2) => _GotGameDetailsCopyWithImpl(v, t, t2));
}

abstract class GotGameDetailsCopyWith<$R, $In extends GotGameDetails, $Out>
    implements GameDetailsStateCopyWith<$R, $In, $Out> {
  GameDetailsCopyWith<$R, GameDetails, GameDetails> get gameDetails;
  @override
  $R call({GameDetails? gameDetails});
  GotGameDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GotGameDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GotGameDetails, $Out>
    implements GotGameDetailsCopyWith<$R, GotGameDetails, $Out> {
  _GotGameDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GotGameDetails> $mapper =
      GotGameDetailsMapper.ensureInitialized();
  @override
  GameDetailsCopyWith<$R, GameDetails, GameDetails> get gameDetails =>
      $value.gameDetails.copyWith.$chain((v) => call(gameDetails: v));
  @override
  $R call({GameDetails? gameDetails}) => $apply(
      FieldCopyWithData({if (gameDetails != null) #gameDetails: gameDetails}));
  @override
  GotGameDetails $make(CopyWithData data) => GotGameDetails(
      gameDetails: data.get(#gameDetails, or: $value.gameDetails));

  @override
  GotGameDetailsCopyWith<$R2, GotGameDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GotGameDetailsCopyWithImpl($value, $cast, t);
}

class UpdatedGameDetailsMapper extends ClassMapperBase<UpdatedGameDetails> {
  UpdatedGameDetailsMapper._();

  static UpdatedGameDetailsMapper? _instance;
  static UpdatedGameDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdatedGameDetailsMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdatedGameDetails';

  @override
  final MappableFields<UpdatedGameDetails> fields = const {};

  static UpdatedGameDetails _instantiate(DecodingData data) {
    return UpdatedGameDetails();
  }

  @override
  final Function instantiate = _instantiate;

  static UpdatedGameDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdatedGameDetails>(map);
  }

  static UpdatedGameDetails fromJson(String json) {
    return ensureInitialized().decodeJson<UpdatedGameDetails>(json);
  }
}

mixin UpdatedGameDetailsMappable {
  String toJson() {
    return UpdatedGameDetailsMapper.ensureInitialized()
        .encodeJson<UpdatedGameDetails>(this as UpdatedGameDetails);
  }

  Map<String, dynamic> toMap() {
    return UpdatedGameDetailsMapper.ensureInitialized()
        .encodeMap<UpdatedGameDetails>(this as UpdatedGameDetails);
  }

  UpdatedGameDetailsCopyWith<UpdatedGameDetails, UpdatedGameDetails,
          UpdatedGameDetails>
      get copyWith => _UpdatedGameDetailsCopyWithImpl(
          this as UpdatedGameDetails, $identity, $identity);
  @override
  String toString() {
    return UpdatedGameDetailsMapper.ensureInitialized()
        .stringifyValue(this as UpdatedGameDetails);
  }

  @override
  bool operator ==(Object other) {
    return UpdatedGameDetailsMapper.ensureInitialized()
        .equalsValue(this as UpdatedGameDetails, other);
  }

  @override
  int get hashCode {
    return UpdatedGameDetailsMapper.ensureInitialized()
        .hashValue(this as UpdatedGameDetails);
  }
}

extension UpdatedGameDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdatedGameDetails, $Out> {
  UpdatedGameDetailsCopyWith<$R, UpdatedGameDetails, $Out>
      get $asUpdatedGameDetails =>
          $base.as((v, t, t2) => _UpdatedGameDetailsCopyWithImpl(v, t, t2));
}

abstract class UpdatedGameDetailsCopyWith<$R, $In extends UpdatedGameDetails,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UpdatedGameDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdatedGameDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdatedGameDetails, $Out>
    implements UpdatedGameDetailsCopyWith<$R, UpdatedGameDetails, $Out> {
  _UpdatedGameDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdatedGameDetails> $mapper =
      UpdatedGameDetailsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UpdatedGameDetails $make(CopyWithData data) => UpdatedGameDetails();

  @override
  UpdatedGameDetailsCopyWith<$R2, UpdatedGameDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpdatedGameDetailsCopyWithImpl($value, $cast, t);
}

class DownloadingGameImageMapper extends ClassMapperBase<DownloadingGameImage> {
  DownloadingGameImageMapper._();

  static DownloadingGameImageMapper? _instance;
  static DownloadingGameImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DownloadingGameImageMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadingGameImage';

  static GameImageType _$imageType(DownloadingGameImage v) => v.imageType;
  static const Field<DownloadingGameImage, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<DownloadingGameImage> fields = const {
    #imageType: _f$imageType,
  };

  static DownloadingGameImage _instantiate(DecodingData data) {
    return DownloadingGameImage(imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadingGameImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadingGameImage>(map);
  }

  static DownloadingGameImage fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadingGameImage>(json);
  }
}

mixin DownloadingGameImageMappable {
  String toJson() {
    return DownloadingGameImageMapper.ensureInitialized()
        .encodeJson<DownloadingGameImage>(this as DownloadingGameImage);
  }

  Map<String, dynamic> toMap() {
    return DownloadingGameImageMapper.ensureInitialized()
        .encodeMap<DownloadingGameImage>(this as DownloadingGameImage);
  }

  DownloadingGameImageCopyWith<DownloadingGameImage, DownloadingGameImage,
          DownloadingGameImage>
      get copyWith => _DownloadingGameImageCopyWithImpl(
          this as DownloadingGameImage, $identity, $identity);
  @override
  String toString() {
    return DownloadingGameImageMapper.ensureInitialized()
        .stringifyValue(this as DownloadingGameImage);
  }

  @override
  bool operator ==(Object other) {
    return DownloadingGameImageMapper.ensureInitialized()
        .equalsValue(this as DownloadingGameImage, other);
  }

  @override
  int get hashCode {
    return DownloadingGameImageMapper.ensureInitialized()
        .hashValue(this as DownloadingGameImage);
  }
}

extension DownloadingGameImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadingGameImage, $Out> {
  DownloadingGameImageCopyWith<$R, DownloadingGameImage, $Out>
      get $asDownloadingGameImage =>
          $base.as((v, t, t2) => _DownloadingGameImageCopyWithImpl(v, t, t2));
}

abstract class DownloadingGameImageCopyWith<
    $R,
    $In extends DownloadingGameImage,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GameImageType? imageType});
  DownloadingGameImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadingGameImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadingGameImage, $Out>
    implements DownloadingGameImageCopyWith<$R, DownloadingGameImage, $Out> {
  _DownloadingGameImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadingGameImage> $mapper =
      DownloadingGameImageMapper.ensureInitialized();
  @override
  $R call({GameImageType? imageType}) =>
      $apply(FieldCopyWithData({if (imageType != null) #imageType: imageType}));
  @override
  DownloadingGameImage $make(CopyWithData data) => DownloadingGameImage(
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  DownloadingGameImageCopyWith<$R2, DownloadingGameImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadingGameImageCopyWithImpl($value, $cast, t);
}

class DownloadedGameImageMapper extends ClassMapperBase<DownloadedGameImage> {
  DownloadedGameImageMapper._();

  static DownloadedGameImageMapper? _instance;
  static DownloadedGameImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DownloadedGameImageMapper._());
      GameDetailsStateMapper.ensureInitialized();
      GameDetailsImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadedGameImage';

  static GameDetailsImage _$gameDetailsImage(DownloadedGameImage v) =>
      v.gameDetailsImage;
  static const Field<DownloadedGameImage, GameDetailsImage>
      _f$gameDetailsImage = Field('gameDetailsImage', _$gameDetailsImage);
  static GameImageType _$imageType(DownloadedGameImage v) => v.imageType;
  static const Field<DownloadedGameImage, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<DownloadedGameImage> fields = const {
    #gameDetailsImage: _f$gameDetailsImage,
    #imageType: _f$imageType,
  };

  static DownloadedGameImage _instantiate(DecodingData data) {
    return DownloadedGameImage(
        gameDetailsImage: data.dec(_f$gameDetailsImage),
        imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadedGameImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadedGameImage>(map);
  }

  static DownloadedGameImage fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadedGameImage>(json);
  }
}

mixin DownloadedGameImageMappable {
  String toJson() {
    return DownloadedGameImageMapper.ensureInitialized()
        .encodeJson<DownloadedGameImage>(this as DownloadedGameImage);
  }

  Map<String, dynamic> toMap() {
    return DownloadedGameImageMapper.ensureInitialized()
        .encodeMap<DownloadedGameImage>(this as DownloadedGameImage);
  }

  DownloadedGameImageCopyWith<DownloadedGameImage, DownloadedGameImage,
          DownloadedGameImage>
      get copyWith => _DownloadedGameImageCopyWithImpl(
          this as DownloadedGameImage, $identity, $identity);
  @override
  String toString() {
    return DownloadedGameImageMapper.ensureInitialized()
        .stringifyValue(this as DownloadedGameImage);
  }

  @override
  bool operator ==(Object other) {
    return DownloadedGameImageMapper.ensureInitialized()
        .equalsValue(this as DownloadedGameImage, other);
  }

  @override
  int get hashCode {
    return DownloadedGameImageMapper.ensureInitialized()
        .hashValue(this as DownloadedGameImage);
  }
}

extension DownloadedGameImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadedGameImage, $Out> {
  DownloadedGameImageCopyWith<$R, DownloadedGameImage, $Out>
      get $asDownloadedGameImage =>
          $base.as((v, t, t2) => _DownloadedGameImageCopyWithImpl(v, t, t2));
}

abstract class DownloadedGameImageCopyWith<$R, $In extends DownloadedGameImage,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  GameDetailsImageCopyWith<$R, GameDetailsImage, GameDetailsImage>
      get gameDetailsImage;
  @override
  $R call({GameDetailsImage? gameDetailsImage, GameImageType? imageType});
  DownloadedGameImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadedGameImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadedGameImage, $Out>
    implements DownloadedGameImageCopyWith<$R, DownloadedGameImage, $Out> {
  _DownloadedGameImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadedGameImage> $mapper =
      DownloadedGameImageMapper.ensureInitialized();
  @override
  GameDetailsImageCopyWith<$R, GameDetailsImage, GameDetailsImage>
      get gameDetailsImage => $value.gameDetailsImage.copyWith
          .$chain((v) => call(gameDetailsImage: v));
  @override
  $R call({GameDetailsImage? gameDetailsImage, GameImageType? imageType}) =>
      $apply(FieldCopyWithData({
        if (gameDetailsImage != null) #gameDetailsImage: gameDetailsImage,
        if (imageType != null) #imageType: imageType
      }));
  @override
  DownloadedGameImage $make(CopyWithData data) => DownloadedGameImage(
      gameDetailsImage:
          data.get(#gameDetailsImage, or: $value.gameDetailsImage),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  DownloadedGameImageCopyWith<$R2, DownloadedGameImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadedGameImageCopyWithImpl($value, $cast, t);
}

class UploadingGameImageMapper extends ClassMapperBase<UploadingGameImage> {
  UploadingGameImageMapper._();

  static UploadingGameImageMapper? _instance;
  static UploadingGameImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadingGameImageMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadingGameImage';

  static GameImageType _$imageType(UploadingGameImage v) => v.imageType;
  static const Field<UploadingGameImage, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<UploadingGameImage> fields = const {
    #imageType: _f$imageType,
  };

  static UploadingGameImage _instantiate(DecodingData data) {
    return UploadingGameImage(imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadingGameImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadingGameImage>(map);
  }

  static UploadingGameImage fromJson(String json) {
    return ensureInitialized().decodeJson<UploadingGameImage>(json);
  }
}

mixin UploadingGameImageMappable {
  String toJson() {
    return UploadingGameImageMapper.ensureInitialized()
        .encodeJson<UploadingGameImage>(this as UploadingGameImage);
  }

  Map<String, dynamic> toMap() {
    return UploadingGameImageMapper.ensureInitialized()
        .encodeMap<UploadingGameImage>(this as UploadingGameImage);
  }

  UploadingGameImageCopyWith<UploadingGameImage, UploadingGameImage,
          UploadingGameImage>
      get copyWith => _UploadingGameImageCopyWithImpl(
          this as UploadingGameImage, $identity, $identity);
  @override
  String toString() {
    return UploadingGameImageMapper.ensureInitialized()
        .stringifyValue(this as UploadingGameImage);
  }

  @override
  bool operator ==(Object other) {
    return UploadingGameImageMapper.ensureInitialized()
        .equalsValue(this as UploadingGameImage, other);
  }

  @override
  int get hashCode {
    return UploadingGameImageMapper.ensureInitialized()
        .hashValue(this as UploadingGameImage);
  }
}

extension UploadingGameImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadingGameImage, $Out> {
  UploadingGameImageCopyWith<$R, UploadingGameImage, $Out>
      get $asUploadingGameImage =>
          $base.as((v, t, t2) => _UploadingGameImageCopyWithImpl(v, t, t2));
}

abstract class UploadingGameImageCopyWith<$R, $In extends UploadingGameImage,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GameImageType? imageType});
  UploadingGameImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadingGameImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadingGameImage, $Out>
    implements UploadingGameImageCopyWith<$R, UploadingGameImage, $Out> {
  _UploadingGameImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadingGameImage> $mapper =
      UploadingGameImageMapper.ensureInitialized();
  @override
  $R call({GameImageType? imageType}) =>
      $apply(FieldCopyWithData({if (imageType != null) #imageType: imageType}));
  @override
  UploadingGameImage $make(CopyWithData data) =>
      UploadingGameImage(imageType: data.get(#imageType, or: $value.imageType));

  @override
  UploadingGameImageCopyWith<$R2, UploadingGameImage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadingGameImageCopyWithImpl($value, $cast, t);
}

class UploadedGameImageMapper extends ClassMapperBase<UploadedGameImage> {
  UploadedGameImageMapper._();

  static UploadedGameImageMapper? _instance;
  static UploadedGameImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UploadedGameImageMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadedGameImage';

  static GameImageType _$imageType(UploadedGameImage v) => v.imageType;
  static const Field<UploadedGameImage, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<UploadedGameImage> fields = const {
    #imageType: _f$imageType,
  };

  static UploadedGameImage _instantiate(DecodingData data) {
    return UploadedGameImage(imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadedGameImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadedGameImage>(map);
  }

  static UploadedGameImage fromJson(String json) {
    return ensureInitialized().decodeJson<UploadedGameImage>(json);
  }
}

mixin UploadedGameImageMappable {
  String toJson() {
    return UploadedGameImageMapper.ensureInitialized()
        .encodeJson<UploadedGameImage>(this as UploadedGameImage);
  }

  Map<String, dynamic> toMap() {
    return UploadedGameImageMapper.ensureInitialized()
        .encodeMap<UploadedGameImage>(this as UploadedGameImage);
  }

  UploadedGameImageCopyWith<UploadedGameImage, UploadedGameImage,
          UploadedGameImage>
      get copyWith => _UploadedGameImageCopyWithImpl(
          this as UploadedGameImage, $identity, $identity);
  @override
  String toString() {
    return UploadedGameImageMapper.ensureInitialized()
        .stringifyValue(this as UploadedGameImage);
  }

  @override
  bool operator ==(Object other) {
    return UploadedGameImageMapper.ensureInitialized()
        .equalsValue(this as UploadedGameImage, other);
  }

  @override
  int get hashCode {
    return UploadedGameImageMapper.ensureInitialized()
        .hashValue(this as UploadedGameImage);
  }
}

extension UploadedGameImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadedGameImage, $Out> {
  UploadedGameImageCopyWith<$R, UploadedGameImage, $Out>
      get $asUploadedGameImage =>
          $base.as((v, t, t2) => _UploadedGameImageCopyWithImpl(v, t, t2));
}

abstract class UploadedGameImageCopyWith<$R, $In extends UploadedGameImage,
    $Out> implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GameImageType? imageType});
  UploadedGameImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadedGameImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadedGameImage, $Out>
    implements UploadedGameImageCopyWith<$R, UploadedGameImage, $Out> {
  _UploadedGameImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadedGameImage> $mapper =
      UploadedGameImageMapper.ensureInitialized();
  @override
  $R call({GameImageType? imageType}) =>
      $apply(FieldCopyWithData({if (imageType != null) #imageType: imageType}));
  @override
  UploadedGameImage $make(CopyWithData data) =>
      UploadedGameImage(imageType: data.get(#imageType, or: $value.imageType));

  @override
  UploadedGameImageCopyWith<$R2, UploadedGameImage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UploadedGameImageCopyWithImpl($value, $cast, t);
}

class GameDetailsErrorMapper extends ClassMapperBase<GameDetailsError> {
  GameDetailsErrorMapper._();

  static GameDetailsErrorMapper? _instance;
  static GameDetailsErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameDetailsErrorMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameDetailsError';

  static String _$message(GameDetailsError v) => v.message;
  static const Field<GameDetailsError, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<GameDetailsError> fields = const {
    #message: _f$message,
  };

  static GameDetailsError _instantiate(DecodingData data) {
    return GameDetailsError(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static GameDetailsError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameDetailsError>(map);
  }

  static GameDetailsError fromJson(String json) {
    return ensureInitialized().decodeJson<GameDetailsError>(json);
  }
}

mixin GameDetailsErrorMappable {
  String toJson() {
    return GameDetailsErrorMapper.ensureInitialized()
        .encodeJson<GameDetailsError>(this as GameDetailsError);
  }

  Map<String, dynamic> toMap() {
    return GameDetailsErrorMapper.ensureInitialized()
        .encodeMap<GameDetailsError>(this as GameDetailsError);
  }

  GameDetailsErrorCopyWith<GameDetailsError, GameDetailsError, GameDetailsError>
      get copyWith => _GameDetailsErrorCopyWithImpl(
          this as GameDetailsError, $identity, $identity);
  @override
  String toString() {
    return GameDetailsErrorMapper.ensureInitialized()
        .stringifyValue(this as GameDetailsError);
  }

  @override
  bool operator ==(Object other) {
    return GameDetailsErrorMapper.ensureInitialized()
        .equalsValue(this as GameDetailsError, other);
  }

  @override
  int get hashCode {
    return GameDetailsErrorMapper.ensureInitialized()
        .hashValue(this as GameDetailsError);
  }
}

extension GameDetailsErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameDetailsError, $Out> {
  GameDetailsErrorCopyWith<$R, GameDetailsError, $Out>
      get $asGameDetailsError =>
          $base.as((v, t, t2) => _GameDetailsErrorCopyWithImpl(v, t, t2));
}

abstract class GameDetailsErrorCopyWith<$R, $In extends GameDetailsError, $Out>
    implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  GameDetailsErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameDetailsErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameDetailsError, $Out>
    implements GameDetailsErrorCopyWith<$R, GameDetailsError, $Out> {
  _GameDetailsErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameDetailsError> $mapper =
      GameDetailsErrorMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  GameDetailsError $make(CopyWithData data) =>
      GameDetailsError(message: data.get(#message, or: $value.message));

  @override
  GameDetailsErrorCopyWith<$R2, GameDetailsError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameDetailsErrorCopyWithImpl($value, $cast, t);
}

class GameImageErrorMapper extends ClassMapperBase<GameImageError> {
  GameImageErrorMapper._();

  static GameImageErrorMapper? _instance;
  static GameImageErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameImageErrorMapper._());
      GameDetailsStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameImageError';

  static String _$message(GameImageError v) => v.message;
  static const Field<GameImageError, String> _f$message =
      Field('message', _$message);
  static GameImageType _$imageType(GameImageError v) => v.imageType;
  static const Field<GameImageError, GameImageType> _f$imageType =
      Field('imageType', _$imageType);

  @override
  final MappableFields<GameImageError> fields = const {
    #message: _f$message,
    #imageType: _f$imageType,
  };

  static GameImageError _instantiate(DecodingData data) {
    return GameImageError(
        message: data.dec(_f$message), imageType: data.dec(_f$imageType));
  }

  @override
  final Function instantiate = _instantiate;

  static GameImageError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameImageError>(map);
  }

  static GameImageError fromJson(String json) {
    return ensureInitialized().decodeJson<GameImageError>(json);
  }
}

mixin GameImageErrorMappable {
  String toJson() {
    return GameImageErrorMapper.ensureInitialized()
        .encodeJson<GameImageError>(this as GameImageError);
  }

  Map<String, dynamic> toMap() {
    return GameImageErrorMapper.ensureInitialized()
        .encodeMap<GameImageError>(this as GameImageError);
  }

  GameImageErrorCopyWith<GameImageError, GameImageError, GameImageError>
      get copyWith => _GameImageErrorCopyWithImpl(
          this as GameImageError, $identity, $identity);
  @override
  String toString() {
    return GameImageErrorMapper.ensureInitialized()
        .stringifyValue(this as GameImageError);
  }

  @override
  bool operator ==(Object other) {
    return GameImageErrorMapper.ensureInitialized()
        .equalsValue(this as GameImageError, other);
  }

  @override
  int get hashCode {
    return GameImageErrorMapper.ensureInitialized()
        .hashValue(this as GameImageError);
  }
}

extension GameImageErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameImageError, $Out> {
  GameImageErrorCopyWith<$R, GameImageError, $Out> get $asGameImageError =>
      $base.as((v, t, t2) => _GameImageErrorCopyWithImpl(v, t, t2));
}

abstract class GameImageErrorCopyWith<$R, $In extends GameImageError, $Out>
    implements GameDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, GameImageType? imageType});
  GameImageErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GameImageErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameImageError, $Out>
    implements GameImageErrorCopyWith<$R, GameImageError, $Out> {
  _GameImageErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameImageError> $mapper =
      GameImageErrorMapper.ensureInitialized();
  @override
  $R call({String? message, GameImageType? imageType}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (imageType != null) #imageType: imageType
      }));
  @override
  GameImageError $make(CopyWithData data) => GameImageError(
      message: data.get(#message, or: $value.message),
      imageType: data.get(#imageType, or: $value.imageType));

  @override
  GameImageErrorCopyWith<$R2, GameImageError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameImageErrorCopyWithImpl($value, $cast, t);
}
