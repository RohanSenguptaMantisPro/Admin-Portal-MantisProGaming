part of 'game_details_bloc.dart';

@MappableClass()
abstract class GameDetailsEvent with GameDetailsEventMappable {
  const GameDetailsEvent();
}

@MappableClass()
class GetGameDetailsEvent extends GameDetailsEvent
    with GetGameDetailsEventMappable {
  GetGameDetailsEvent({
    required this.getGameDetailsParams,
  });

  final GetGameDetailsParams getGameDetailsParams;
}

@MappableClass()
class UpdateGameDetailsEvent extends GameDetailsEvent
    with UpdateGameDetailsEventMappable {
  UpdateGameDetailsEvent({
    required this.updateGameDetailsParams,
  });

  final UpdateGameDetailsParams updateGameDetailsParams;
}

@MappableClass()
class DownloadGameImagesEvent extends GameDetailsEvent
    with DownloadGameImagesEventMappable {
  DownloadGameImagesEvent({
    required this.downloadGameImagesParams,
    required this.imageType,
  });

  final DownloadGameImagesParams downloadGameImagesParams;
  final GameImageType imageType;
}

@MappableClass()
class UploadGameImagesEvent extends GameDetailsEvent
    with UploadGameImagesEventMappable {
  UploadGameImagesEvent({
    required this.uploadGameImagesParams,
    required this.imageType,
  });

  final UploadGameImagesParams uploadGameImagesParams;
  final GameImageType imageType;
}
