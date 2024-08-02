import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_details_model.mapper.dart';

@MappableClass(discriminatorValue: 'gameDetailsModel')
class GameDetailsModel extends GameDetails with GameDetailsModelMappable {
  const GameDetailsModel({
    required super.id,
    required super.name,
    required super.packageName,
    required super.timesAdded,
    required super.timesPlayed,
    required super.createdAt,
    required super.updatedAt,
  });

  const GameDetailsModel.empty()
      : this(
          id: '',
          name: '',
          packageName: '',
          timesAdded: 0,
          timesPlayed: 0,
          createdAt: '',
          updatedAt: '',
        );

  static GameDetailsModel fromJson(String json) =>
      GameDetailsModelMapper.fromJson(json);
}
