import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'get_game_details.mapper.dart';

class GetGameDetails
    extends UsecaseWithParams<GameDetails, GetGameDetailsParams> {
  const GetGameDetails(this._repo);

  final GameDetailsRepo _repo;

  @override
  ResultFuture<GameDetails> call(GetGameDetailsParams params) =>
      _repo.getGameDetails(getGameDetailsParams: params);
}

@MappableClass(discriminatorKey: 'type')
class GetGameDetailsParams with GetGameDetailsParamsMappable {
  const GetGameDetailsParams({
    required this.userToken,
    required this.gameObjectId,
  });

  GetGameDetailsParams.empty()
      : this(
          userToken: '',
          gameObjectId: '',
        );

  final String userToken;
  final String gameObjectId;
}
