part of 'game_details_bloc.dart';

@MappableClass()
abstract class GameDetailsState with GameDetailsStateMappable {
  const GameDetailsState();
}

@MappableClass()
class GameDetailsInitial extends GameDetailsState
    with GameDetailsInitialMappable {
  const GameDetailsInitial();
}

@MappableClass()
class GettingGameDetails extends GameDetailsState
    with GettingGameDetailsMappable {
  const GettingGameDetails();
}

@MappableClass()
class UpdatingGameDetails extends GameDetailsState
    with UpdatingGameDetailsMappable {
  const UpdatingGameDetails();
}

@MappableClass()
class GotGameDetails extends GameDetailsState with GotGameDetailsMappable {
  const GotGameDetails({required this.gameDetails});

  final GameDetails gameDetails;
}

@MappableClass()
class UpdatedGameDetails extends GameDetailsState
    with UpdatedGameDetailsMappable {
  const UpdatedGameDetails();
}

@MappableClass()
class DownloadingGameImage extends GameDetailsState
    with DownloadingGameImageMappable {
  const DownloadingGameImage({required this.imageType});

  final GameImageType imageType;
}

@MappableClass()
class DownloadedGameImage extends GameDetailsState
    with DownloadedGameImageMappable {
  const DownloadedGameImage(
      {required this.gameDetailsImage, required this.imageType});

  final GameDetailsImage gameDetailsImage;
  final GameImageType imageType;
}

@MappableClass()
class UploadingGameImage extends GameDetailsState
    with UploadingGameImageMappable {
  const UploadingGameImage({required this.imageType});

  final GameImageType imageType;
}

@MappableClass()
class UploadedGameImage extends GameDetailsState
    with UploadedGameImageMappable {
  const UploadedGameImage({required this.imageType});

  final GameImageType imageType;
}

@MappableClass()
class GameDetailsError extends GameDetailsState with GameDetailsErrorMappable {
  const GameDetailsError({required this.message});

  final String message;
}

@MappableClass()
class GameImageError extends GameDetailsState with GameImageErrorMappable {
  const GameImageError({required this.message, required this.imageType});

  final String message;
  final GameImageType imageType;
}
