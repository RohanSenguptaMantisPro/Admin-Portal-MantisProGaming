import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'update_game_details.mapper.dart';

class UpdateGameDetails
    extends UsecaseWithParams<void, UpdateGameDetailsParams> {
  const UpdateGameDetails(this._repo);

  final GameDetailsRepo _repo;

  @override
  ResultFuture<void> call(UpdateGameDetailsParams params) =>
      _repo.updateGameDetails(updateGameDetailsParams: params);
}

@MappableClass(discriminatorKey: 'type')
class UpdateGameDetailsParams with UpdateGameDetailsParamsMappable {
  const UpdateGameDetailsParams({
    required this.userToken,
    required this.gameObjectId,
    required this.gameName,
  });

  const UpdateGameDetailsParams.empty()
      : this(
          userToken: '',
          gameObjectId: '',
          gameName: '',
        );

  final String userToken;
  final String gameObjectId;
  final String gameName;
}
