import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/bloc/game_details_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_asset_name_enum.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGameDetails extends Mock implements GetGameDetails {}

class MockUpdateGameDetails extends Mock implements UpdateGameDetails {}

class MockDownloadGameImages extends Mock implements DownloadGameImages {}

class MockUploadGameImages extends Mock implements UploadGameImages {}

void main() {
  late GetGameDetails getGameDetails;
  late UpdateGameDetails updateGameDetails;
  late DownloadGameImages downloadGameImages;
  late UploadGameImages uploadGameImages;
  late GameDetailsBloc gameDetailsBloc;

  final tGetGameDetailsParams = GetGameDetailsParams.empty();
  const tUpdateGameDetailsParams = UpdateGameDetailsParams.empty();
  final tDownloadGameImagesParams = DownloadGameImagesParams.empty();
  final tUploadGameImagesParams = UploadGameImagesParams.empty();

  const tGameDetails = GameDetails.empty();

  final tGameDetailsImage = GameDetailsImage.empty();
  const tImageType = GameImageType.capsule;

  final tGameDetailsFetchFailure = ServerFailure(
    message: 'could not fetch game details',
    statusCode: '404',
  );
  final tGameDetailsUpdateFailure = ServerFailure(
    message: 'could not update game details',
    statusCode: '400',
  );
  final tGameImageDownloadFailure = ServerFailure(
    message: 'could not download game image',
    statusCode: '404',
  );
  final tGameImageUploadFailure = ServerFailure(
    message: 'could not upload game image',
    statusCode: '400',
  );

  setUp(() {
    getGameDetails = MockGetGameDetails();
    updateGameDetails = MockUpdateGameDetails();
    downloadGameImages = MockDownloadGameImages();
    uploadGameImages = MockUploadGameImages();

    gameDetailsBloc = GameDetailsBloc(
      getGameDetails: getGameDetails,
      updateGameDetails: updateGameDetails,
      downloadGameImages: downloadGameImages,
      uploadGameImages: uploadGameImages,
    );
  });

  setUpAll(() {
    registerFallbackValue(tGetGameDetailsParams);
    registerFallbackValue(tUpdateGameDetailsParams);
    registerFallbackValue(tDownloadGameImagesParams);
    registerFallbackValue(tUploadGameImagesParams);
  });

  tearDown(() => gameDetailsBloc.close());

  test('initialState should be GameDetailsInitial', () {
    expect(gameDetailsBloc.state, const GameDetailsInitial());
  });

  group('GetGameDetailsEvent', () {
    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [GettingGameDetails, GotGameDetails] when GetGameDetailsEvent is added and succeeds',
      build: () {
        when(() => getGameDetails(any())).thenAnswer(
          (_) async => const Right(tGameDetails),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(
          GetGameDetailsEvent(getGameDetailsParams: tGetGameDetailsParams)),
      expect: () => [
        const GettingGameDetails(),
        const GotGameDetails(gameDetails: tGameDetails),
      ],
      verify: (_) {
        verify(() => getGameDetails(tGetGameDetailsParams)).called(1);
        verifyNoMoreInteractions(getGameDetails);
      },
    );

    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [GettingGameDetails, GameDetailsError] when GetGameDetailsEvent is added and fails',
      build: () {
        when(() => getGameDetails(any())).thenAnswer(
          (_) async => Left(tGameDetailsFetchFailure),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(
          GetGameDetailsEvent(getGameDetailsParams: tGetGameDetailsParams)),
      expect: () => [
        const GettingGameDetails(),
        GameDetailsError(message: tGameDetailsFetchFailure.message),
      ],
      verify: (_) {
        verify(() => getGameDetails(tGetGameDetailsParams)).called(1);
        verifyNoMoreInteractions(getGameDetails);
      },
    );
  });

  group('UpdateGameDetailsEvent', () {
    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [UpdatingGameDetails, UpdatedGameDetails] when UpdateGameDetailsEvent is added and succeeds',
      build: () {
        when(() => updateGameDetails(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(UpdateGameDetailsEvent(
          updateGameDetailsParams: tUpdateGameDetailsParams)),
      expect: () => [
        const UpdatingGameDetails(),
        const UpdatedGameDetails(),
      ],
      verify: (_) {
        verify(() => updateGameDetails(tUpdateGameDetailsParams)).called(1);
        verifyNoMoreInteractions(updateGameDetails);
      },
    );

    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [UpdatingGameDetails, GameDetailsError] when UpdateGameDetailsEvent is added and fails',
      build: () {
        when(() => updateGameDetails(any())).thenAnswer(
          (_) async => Left(tGameDetailsUpdateFailure),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(UpdateGameDetailsEvent(
          updateGameDetailsParams: tUpdateGameDetailsParams)),
      expect: () => [
        const UpdatingGameDetails(),
        GameDetailsError(message: tGameDetailsUpdateFailure.message),
      ],
      verify: (_) {
        verify(() => updateGameDetails(tUpdateGameDetailsParams)).called(1);
        verifyNoMoreInteractions(updateGameDetails);
      },
    );
  });

  group('DownloadGameImagesEvent', () {
    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [DownloadingGameImage, DownloadedGameImage] when DownloadGameImagesEvent is added and succeeds',
      build: () {
        when(() => downloadGameImages(any())).thenAnswer(
          (_) async => Right(tGameDetailsImage),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(DownloadGameImagesEvent(
        downloadGameImagesParams: tDownloadGameImagesParams,
        imageType: tImageType,
      )),
      expect: () => [
        const DownloadingGameImage(imageType: tImageType),
        DownloadedGameImage(
            gameDetailsImage: tGameDetailsImage, imageType: tImageType),
      ],
      verify: (_) {
        verify(() => downloadGameImages(tDownloadGameImagesParams)).called(1);
        verifyNoMoreInteractions(downloadGameImages);
      },
    );

    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [DownloadingGameImage, GameImageError] when DownloadGameImagesEvent is added and fails',
      build: () {
        when(() => downloadGameImages(any())).thenAnswer(
          (_) async => Left(tGameImageDownloadFailure),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(DownloadGameImagesEvent(
        downloadGameImagesParams: tDownloadGameImagesParams,
        imageType: tImageType,
      )),
      expect: () => [
        const DownloadingGameImage(imageType: tImageType),
        GameImageError(
            message: tGameImageDownloadFailure.message, imageType: tImageType),
      ],
      verify: (_) {
        verify(() => downloadGameImages(tDownloadGameImagesParams)).called(1);
        verifyNoMoreInteractions(downloadGameImages);
      },
    );
  });


  group('UploadGameImagesEvent', () {
    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [UploadingGameImage, UploadedGameImage] when UploadGameImagesEvent is added and succeeds',
      build: () {
        when(() => uploadGameImages(any())).thenAnswer(
              (_) async => const Right(null),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(UploadGameImagesEvent(
        uploadGameImagesParams: tUploadGameImagesParams,
        imageType: tImageType,
      )),
      expect: () => [
        const UploadingGameImage(imageType: tImageType),
        const UploadedGameImage(imageType: tImageType),
      ],
      verify: (_) {
        verify(() => uploadGameImages(tUploadGameImagesParams)).called(1);
        verifyNoMoreInteractions(uploadGameImages);
      },
    );

    blocTest<GameDetailsBloc, GameDetailsState>(
      'should emit [UploadingGameImage, GameImageError] when UploadGameImagesEvent is added and fails',
      build: () {
        when(() => uploadGameImages(any())).thenAnswer(
              (_) async => Left(tGameImageUploadFailure),
        );
        return gameDetailsBloc;
      },
      act: (bloc) => bloc.add(UploadGameImagesEvent(
        uploadGameImagesParams: tUploadGameImagesParams,
        imageType: tImageType,
      )),
      expect: () => [
        const UploadingGameImage(imageType: tImageType),
        GameImageError(message: tGameImageUploadFailure.message, imageType: tImageType),
      ],
      verify: (_) {
        verify(() => uploadGameImages(tUploadGameImagesParams)).called(1);
        verifyNoMoreInteractions(uploadGameImages);
      },
    );
  });
}
