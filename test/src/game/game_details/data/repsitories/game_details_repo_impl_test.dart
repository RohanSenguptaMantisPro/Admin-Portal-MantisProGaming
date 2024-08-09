import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/datasources/game_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/repsitories/game_details_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailsRemoteDataSource extends Mock
    implements GameDetailsRemoteDataSource {}

void main() {
  late GameDetailsRemoteDataSource remoteDataSource;
  late GameDetailsRepoImpl repoImpl;

  const tGameDetailsModel = GameDetailsModel.empty();
  final tGameDetailsImageModel = GameDetailsImageModel.empty();

  final tGetGameDetailsParams = GetGameDetailsParams.empty();
  const tUpdateGameDetailsParams = UpdateGameDetailsParams.empty();
  final tDownloadGameImagesParams = DownloadGameImagesParams.empty();
  final tUploadGameImagesParams = UploadGameImagesParams.empty();

  setUp(() {
    remoteDataSource = MockGameDetailsRemoteDataSource();
    repoImpl = GameDetailsRepoImpl(remoteDataSource);

    registerFallbackValue(tGetGameDetailsParams);
    registerFallbackValue(tUpdateGameDetailsParams);
    registerFallbackValue(tDownloadGameImagesParams);
    registerFallbackValue(tUploadGameImagesParams);
  });

  const tException =
      ServerException(message: 'Server Error', statusCode: '404');

  group('getGameDetails', () {
    test(
      'should return [GameDetails] when call to remote source is successful',
      () async {
        when(
          () => remoteDataSource.getGameDetails(
            getGameDetailsParams: any(named: 'getGameDetailsParams'),
          ),
        ).thenAnswer((_) async => tGameDetailsModel);

        final result = await repoImpl.getGameDetails(
          getGameDetailsParams: tGetGameDetailsParams,
        );

        expect(
          result,
          equals(
            const Right<dynamic, GameDetails>(
              tGameDetailsModel,
            ),
          ),
        );

        verify(
          () => remoteDataSource.getGameDetails(
            getGameDetailsParams: tGetGameDetailsParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source fails',
      () async {
        when(
          () => remoteDataSource.getGameDetails(
            getGameDetailsParams: any(named: 'getGameDetailsParams'),
          ),
        ).thenThrow(tException);

        final result = await repoImpl.getGameDetails(
          getGameDetailsParams: tGetGameDetailsParams,
        );

        expect(
          result,
          equals(Left<dynamic, GameDetails>(
              ServerFailure.fromException(tException))),
        );

        verify(
          () => remoteDataSource.getGameDetails(
            getGameDetailsParams: tGetGameDetailsParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('updateGameDetails', () {
    test(
      'should return [void] when call to remote source is successful',
      () async {
        when(
          () => remoteDataSource.updateGameDetails(
            updateGameDetailsParams: any(named: 'updateGameDetailsParams'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repoImpl.updateGameDetails(
          updateGameDetailsParams: tUpdateGameDetailsParams,
        );

        expect(result, equals(const Right<dynamic, void>(null)));

        verify(
          () => remoteDataSource.updateGameDetails(
            updateGameDetailsParams: tUpdateGameDetailsParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source fails',
      () async {
        when(
          () => remoteDataSource.updateGameDetails(
            updateGameDetailsParams: any(named: 'updateGameDetailsParams'),
          ),
        ).thenThrow(tException);

        final result = await repoImpl.updateGameDetails(
          updateGameDetailsParams: tUpdateGameDetailsParams,
        );

        expect(
          result,
          equals(Left<dynamic, void>(ServerFailure.fromException(tException))),
        );

        verify(
          () => remoteDataSource.updateGameDetails(
            updateGameDetailsParams: tUpdateGameDetailsParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('downloadGameImages', () {
    test(
      'should return [GameDetailsImage] when call to remote source is successful',
      () async {
        when(
          () => remoteDataSource.downloadGameImages(
            downloadGameImagesParams: any(named: 'downloadGameImagesParams'),
          ),
        ).thenAnswer((_) async => tGameDetailsImageModel);

        final result = await repoImpl.downloadGameImages(
          downloadGameImagesParams: tDownloadGameImagesParams,
        );

        expect(
          result,
          equals(
            Right<dynamic, GameDetailsImage>(
              tGameDetailsImageModel,
            ),
          ),
        );

        verify(
          () => remoteDataSource.downloadGameImages(
            downloadGameImagesParams: tDownloadGameImagesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source fails',
      () async {
        when(
          () => remoteDataSource.downloadGameImages(
            downloadGameImagesParams: any(named: 'downloadGameImagesParams'),
          ),
        ).thenThrow(tException);

        final result = await repoImpl.downloadGameImages(
          downloadGameImagesParams: tDownloadGameImagesParams,
        );

        expect(
          result,
          equals(Left<dynamic, GameDetailsImage>(
              ServerFailure.fromException(tException))),
        );

        verify(
          () => remoteDataSource.downloadGameImages(
            downloadGameImagesParams: tDownloadGameImagesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('uploadGameImages', () {
    test(
      'should return [void] when call to remote source is successful',
      () async {
        when(
          () => remoteDataSource.uploadGameImages(
            uploadGameImagesParams: any(named: 'uploadGameImagesParams'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repoImpl.uploadGameImages(
          uploadGameImagesParams: tUploadGameImagesParams,
        );

        expect(result, equals(const Right<dynamic, void>(null)));

        verify(
          () => remoteDataSource.uploadGameImages(
            uploadGameImagesParams: tUploadGameImagesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source fails',
      () async {
        when(
          () => remoteDataSource.uploadGameImages(
            uploadGameImagesParams: any(named: 'uploadGameImagesParams'),
          ),
        ).thenThrow(tException);

        final result = await repoImpl.uploadGameImages(
          uploadGameImagesParams: tUploadGameImagesParams,
        );

        expect(
          result,
          equals(Left<dynamic, void>(ServerFailure.fromException(tException))),
        );

        verify(
          () => remoteDataSource.uploadGameImages(
            uploadGameImagesParams: tUploadGameImagesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
