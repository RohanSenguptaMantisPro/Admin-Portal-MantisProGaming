import 'package:dart_mappable/dart_mappable.dart';

part 'game_data.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class GameData with GameDataMappable {
  const GameData({
    required this.id,
    required this.name,
    required this.packageName,
    required this.timesAdded,
    required this.timesPlayed,
    required this.createdAt,
    required this.updatedAt,
  });

  const GameData.empty()
      : this(
          id: '',
          name: '',
          packageName: '',
          timesAdded: 0,
          timesPlayed: 0,
          createdAt: '',
          updatedAt: '',
        );

  @MappableField(key: '_id')
  final String? id;

  final String? name;
  final String? packageName;
  final int? timesAdded;
  final int? timesPlayed;
  final String? createdAt;
  final String? updatedAt;
}
