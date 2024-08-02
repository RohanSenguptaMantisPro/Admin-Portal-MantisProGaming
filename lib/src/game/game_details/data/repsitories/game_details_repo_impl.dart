import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/datasources/game_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:dartz/dartz.dart';

class GameDetailsRepoImpl implements GameDetailsRepo {
  const GameDetailsRepoImpl(this._remoteDataSource);

  final GameDetailsRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<GameDetails> getGameDetails({
    required GetGameDetailsParams getGameDetailsParams,
  }) async {
    try {
      final gameDetails = await _remoteDataSource.getGameDetails(
        getGameDetailsParams: getGameDetailsParams,
      );
      return Right(gameDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updateGameDetails({
    required UpdateGameDetailsParams updateGameDetailsParams,
  }) async {
    try {
      await _remoteDataSource.updateGameDetails(
        updateGameDetailsParams: updateGameDetailsParams,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<GameDetailsImage> downloadGameImages({
    required DownloadGameImagesParams downloadGameImagesParams,
  }) async {
    try {
      final gameDetailsImage = await _remoteDataSource.downloadGameImages(
        downloadGameImagesParams: downloadGameImagesParams,
      );
      return Right(gameDetailsImage);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> uploadGameImages({
    required UploadGameImagesParams uploadGameImagesParams,
  }) async {
    try {
      await _remoteDataSource.uploadGameImages(
        uploadGameImagesParams: uploadGameImagesParams,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
