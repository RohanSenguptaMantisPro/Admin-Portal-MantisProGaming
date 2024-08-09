import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_asset_name_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_details_bloc.mapper.dart';
part 'game_details_event.dart';
part 'game_details_state.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  GameDetailsBloc({
    required GetGameDetails getGameDetails,
    required UpdateGameDetails updateGameDetails,
    required DownloadGameImages downloadGameImages,
    required UploadGameImages uploadGameImages,
  })  : _getGameDetails = getGameDetails,
        _updateGameDetails = updateGameDetails,
        _downloadGameImages = downloadGameImages,
        _uploadGameImages = uploadGameImages,
        super(const GameDetailsInitial()) {
    on<GetGameDetailsEvent>(_getGameDetailsEventHandler);
    on<UpdateGameDetailsEvent>(_updateGameDetailsEventHandler);
    on<DownloadGameImagesEvent>(_downloadGameImagesEventHandler);
    on<UploadGameImagesEvent>(_uploadGameImagesEventHandler);
  }

  final GetGameDetails _getGameDetails;
  final UpdateGameDetails _updateGameDetails;
  final DownloadGameImages _downloadGameImages;
  final UploadGameImages _uploadGameImages;

  Future<void> _getGameDetailsEventHandler(
    GetGameDetailsEvent event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(const GettingGameDetails());

    final result = await _getGameDetails(
      event.getGameDetailsParams,
    );

    result.fold(
      (failure) => emit(GameDetailsError(message: failure.errorMessage)),
      (gameDetails) => emit(GotGameDetails(gameDetails: gameDetails)),
    );
  }

  Future<void> _updateGameDetailsEventHandler(
    UpdateGameDetailsEvent event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(const UpdatingGameDetails());

    final result = await _updateGameDetails(
      event.updateGameDetailsParams,
    );

    result.fold(
      (failure) => emit(GameDetailsError(message: failure.errorMessage)),
      (_) => emit(const UpdatedGameDetails()),
    );
  }

  Future<void> _downloadGameImagesEventHandler(
    DownloadGameImagesEvent event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(
      DownloadingGameImage(
        imageType: event.imageType,
      ),
    );

    final result = await _downloadGameImages(
      event.downloadGameImagesParams,
    );

    result.fold(
      (failure) => emit(
          GameImageError(message: failure.errorMessage, imageType: event.imageType)),
      (gameDetailsImage) => emit(DownloadedGameImage(
          gameDetailsImage: gameDetailsImage, imageType: event.imageType)),
    );
  }

  Future<void> _uploadGameImagesEventHandler(
    UploadGameImagesEvent event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(UploadingGameImage(imageType: event.imageType));

    final result = await _uploadGameImages(
      event.uploadGameImagesParams,
    );

    result.fold(
      (failure) => emit(
          GameImageError(message: failure.errorMessage, imageType: event.imageType)),
      (_) => emit(UploadedGameImage(imageType: event.imageType)),
    );
  }
}
