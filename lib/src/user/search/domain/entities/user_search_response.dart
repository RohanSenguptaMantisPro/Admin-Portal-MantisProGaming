import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_search_response.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class UserSearchResponse with UserSearchResponseMappable {
  const UserSearchResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    this.data = const [],
  });

  const UserSearchResponse.empty()
      : this(
          page: 0,
          results: 0,
          totalResults: 0,
          data: const [],
        );

  final int page;
  final int results;
  final int totalResults;
  final List<UserData> data;
}
