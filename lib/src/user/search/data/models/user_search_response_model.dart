import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_search_response_model.mapper.dart';

@MappableClass(discriminatorValue: 'userSearchResponseModel')
class UserSearchResponseModel extends UserSearchResponse
    with UserSearchResponseModelMappable {
  const UserSearchResponseModel({
    required super.page,
    required super.results,
    required super.totalResults,
    required super.data,
  });

  const UserSearchResponseModel.empty()
      : this(
          page: 1,
          results: 1,
          totalResults: 1,
          data: const [],
        );

  static UserSearchResponseModel fromJson(String json) =>
      UserSearchResponseModelMapper.fromJson(json);
}
