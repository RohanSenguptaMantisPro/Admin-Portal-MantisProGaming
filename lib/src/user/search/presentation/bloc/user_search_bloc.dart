import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_search_bloc.mapper.dart';

part 'user_search_event.dart';

part 'user_search_state.dart';

class UserSearchBloc extends Bloc<UserSearchEvent, UserSearchState> {
  UserSearchBloc({
    required UserSearchResults userSearchResults,
  })  : _userSearchResults = userSearchResults,
        super(const UserSearchInitial()) {
    on<UserSearchEvent>((event, emit) {
      emit(const UserSearchLoading());
    });
    on<SearchByEvent>(_searchByHandler);
  }

  final UserSearchResults _userSearchResults;

  Future<void> _searchByHandler(
    SearchByEvent event,
    Emitter<UserSearchState> emit,
  ) async {
    final result = await _userSearchResults(
      UserSearchResultsParams(
        userToken: event.userToken,
        pageNumber: event.pageNumber,
        limit: event.limit,
        field: event.field,
        query: event.query,
        country: event.country,
        accountStatus: event.accountStatus,
      ),
    );

    result.fold(
      (failure) => emit(UserSearchError(message: failure.message)),
      (userSearchResponse) => emit(
        FetchedUserData(
          userSearchResponse: userSearchResponse,
        ),
      ),
    );
  }
}
