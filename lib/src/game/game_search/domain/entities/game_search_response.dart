import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_search_response.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class GameSearchResponse with GameSearchResponseMappable {
  const GameSearchResponse({
    required this.status,
    required this.page,
    required this.results,
    required this.totalResults,
    this.data = const [],
  });

  const GameSearchResponse.empty()
      : this(
          status: '',
          page: 1,
          results: 1,
          totalResults: 1,
          data: const [GameData.empty()],
        );

  final String status;
  final int page;
  final int results;
  final int totalResults;
  final List<GameData> data;
}
