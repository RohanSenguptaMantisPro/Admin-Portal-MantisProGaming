import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_search_response_model.mapper.dart';

@MappableClass(discriminatorValue: 'gameSearchResponseModel')
class GameSearchResponseModel extends GameSearchResponse
    with GameSearchResponseModelMappable {
  const GameSearchResponseModel({
    required super.status,
    required super.page,
    required super.results,
    required super.totalResults,
    required super.data,
  });

  const GameSearchResponseModel.empty()
      : this(
          status: '',
          page: 1,
          results: 1,
          totalResults: 1,
          data: const [GameData.empty()],
        );

  static GameSearchResponseModel fromJson(String json) =>
      GameSearchResponseModelMapper.fromJson(json);
}
