// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_search_response_model.dart';

class UserSearchResponseModelMapper
    extends SubClassMapperBase<UserSearchResponseModel> {
  UserSearchResponseModelMapper._();

  static UserSearchResponseModelMapper? _instance;
  static UserSearchResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UserSearchResponseModelMapper._());
      UserSearchResponseMapper.ensureInitialized().addSubMapper(_instance!);
      UserDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchResponseModel';

  static int _$page(UserSearchResponseModel v) => v.page;
  static const Field<UserSearchResponseModel, int> _f$page =
      Field('page', _$page);
  static int _$results(UserSearchResponseModel v) => v.results;
  static const Field<UserSearchResponseModel, int> _f$results =
      Field('results', _$results);
  static int _$totalResults(UserSearchResponseModel v) => v.totalResults;
  static const Field<UserSearchResponseModel, int> _f$totalResults =
      Field('totalResults', _$totalResults);
  static List<UserData> _$data(UserSearchResponseModel v) => v.data;
  static const Field<UserSearchResponseModel, List<UserData>> _f$data =
      Field('data', _$data, def: const []);

  @override
  final MappableFields<UserSearchResponseModel> fields = const {
    #page: _f$page,
    #results: _f$results,
    #totalResults: _f$totalResults,
    #data: _f$data,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'userSearchResponseModel';
  @override
  late final ClassMapperBase superMapper =
      UserSearchResponseMapper.ensureInitialized();

  static UserSearchResponseModel _instantiate(DecodingData data) {
    return UserSearchResponseModel(
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalResults: data.dec(_f$totalResults),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchResponseModel>(map);
  }

  static UserSearchResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchResponseModel>(json);
  }
}

mixin UserSearchResponseModelMappable {
  String toJson() {
    return UserSearchResponseModelMapper.ensureInitialized()
        .encodeJson<UserSearchResponseModel>(this as UserSearchResponseModel);
  }

  Map<String, dynamic> toMap() {
    return UserSearchResponseModelMapper.ensureInitialized()
        .encodeMap<UserSearchResponseModel>(this as UserSearchResponseModel);
  }

  UserSearchResponseModelCopyWith<UserSearchResponseModel,
          UserSearchResponseModel, UserSearchResponseModel>
      get copyWith => _UserSearchResponseModelCopyWithImpl(
          this as UserSearchResponseModel, $identity, $identity);
  @override
  String toString() {
    return UserSearchResponseModelMapper.ensureInitialized()
        .stringifyValue(this as UserSearchResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return UserSearchResponseModelMapper.ensureInitialized()
        .equalsValue(this as UserSearchResponseModel, other);
  }

  @override
  int get hashCode {
    return UserSearchResponseModelMapper.ensureInitialized()
        .hashValue(this as UserSearchResponseModel);
  }
}

extension UserSearchResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchResponseModel, $Out> {
  UserSearchResponseModelCopyWith<$R, UserSearchResponseModel, $Out>
      get $asUserSearchResponseModel => $base
          .as((v, t, t2) => _UserSearchResponseModelCopyWithImpl(v, t, t2));
}

abstract class UserSearchResponseModelCopyWith<
    $R,
    $In extends UserSearchResponseModel,
    $Out> implements UserSearchResponseCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, UserData, UserDataCopyWith<$R, UserData, UserData>> get data;
  @override
  $R call({int? page, int? results, int? totalResults, List<UserData>? data});
  UserSearchResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchResponseModel, $Out>
    implements
        UserSearchResponseModelCopyWith<$R, UserSearchResponseModel, $Out> {
  _UserSearchResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchResponseModel> $mapper =
      UserSearchResponseModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UserData, UserDataCopyWith<$R, UserData, UserData>>
      get data => ListCopyWith(
          $value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  $R call({int? page, int? results, int? totalResults, List<UserData>? data}) =>
      $apply(FieldCopyWithData({
        if (page != null) #page: page,
        if (results != null) #results: results,
        if (totalResults != null) #totalResults: totalResults,
        if (data != null) #data: data
      }));
  @override
  UserSearchResponseModel $make(CopyWithData data) => UserSearchResponseModel(
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalResults: data.get(#totalResults, or: $value.totalResults),
      data: data.get(#data, or: $value.data));

  @override
  UserSearchResponseModelCopyWith<$R2, UserSearchResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UserSearchResponseModelCopyWithImpl($value, $cast, t);
}
