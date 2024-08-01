import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';

abstract class GameDetailsRepo {
  const GameDetailsRepo();

  ResultFuture<GameDetails> getGameDetails({
    required GetGameDetailsParams getGameDetailsParams,
  });

  ResultFuture<void> updateGameDetails({
    required UpdateGameDetailsParams updateGameDetailsParams,
  });

  ResultFuture<GameDetailsImage> downloadGameImages({
    required DownloadGameImagesParams downloadGameImagesParams,
  });

  ResultFuture<void> uploadGameImages({
    required UploadGameImagesParams uploadGameImagesParams,
  });
}
