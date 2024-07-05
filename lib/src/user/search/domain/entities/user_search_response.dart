import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_search_response.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class UserSearchResponse with UserSearchResponseMappable {
  const UserSearchResponse({
    required this.status,
    required this.page,
    required this.results,
    required this.totalResults,
    this.data = const [],
  });

  const UserSearchResponse.empty()
      : this(
          status: '',
          page: 1,
          results: 1,
          totalResults: 1,
          data: const [UserData.empty()],
        );

  final String status;
  final int page;
  final int results;
  final int totalResults;
  final List<UserData> data;
//   note : as i am taking List<UserData> here.
// as I took List<UserData> in UserSearchResponse in domain layer,
// this UserSearchResponseModel also takes List<UserData>,
// and dart_mappable also converts to List<UserData> items of
// data :field.
// not into UserDataModel.
}
