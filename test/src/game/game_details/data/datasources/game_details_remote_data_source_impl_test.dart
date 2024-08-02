import 'dart:convert';
import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/datasources/game_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomHttpClient extends Mock implements CustomHttpClient {}

void main() {
  late CustomHttpClient mockCustomHttpClient;
  late GameDetailsRemoteDataSourceImpl gameDetailsDataSourceImpl;

  setUp(() {
    mockCustomHttpClient = MockCustomHttpClient();

    gameDetailsDataSourceImpl = GameDetailsRemoteDataSourceImpl(
      customHttpClient: mockCustomHttpClient,
    );

    registerFallbackValue(Uri());
    registerFallbackValue(XFile(''));
  });

  const tGameDetailsModel = GameDetailsModel.empty();
  final tGameDetailsImageModel = GameDetailsImageModel.empty();

  final tGetGameDetailsParams = GetGameDetailsParams.empty();
  const tUpdateGameDetailsParams = UpdateGameDetailsParams.empty();
  final tDownloadGameImagesParams = DownloadGameImagesParams.empty();
  final tUploadGameImagesParams = UploadGameImagesParams.empty();

  group('getGameDetails', () {
    test(
      'should return [GameDetailsModel] when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({
              '_id': '',
              'name': '',
              'packageName': '',
              'timesAdded': 0,
              'timesPlayed': 0,
              'createdAt': '',
              'updatedAt': '',
            }),
            200,
          ),
        );

        final result = await gameDetailsDataSourceImpl.getGameDetails(
          getGameDetailsParams: tGetGameDetailsParams,
        );

        expect(result, equals(tGameDetailsModel));

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kGetGameEndpoint/${tGetGameDetailsParams.gameObjectId}',
            ),
            header: {
              'Authorization': 'Bearer ${tGetGameDetailsParams.userToken}',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Failure',
            401,
          ),
        );

        final methodCall = gameDetailsDataSourceImpl.getGameDetails;

        expect(
          () => methodCall(
            getGameDetailsParams: tGetGameDetailsParams,
          ),
          throwsA(
            isA<ServerException>(),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kGetGameEndpoint/${tGetGameDetailsParams.gameObjectId}',
            ),
            header: {
              'Authorization': 'Bearer ${tGetGameDetailsParams.userToken}',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });

  //updateGameDetails
  group('updateGameDetails', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.postRequest(
            any(),
            body: any(named: 'body'),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({'message': 'Game updated successfully'}),
            200,
          ),
        );

        await expectLater(
          gameDetailsDataSourceImpl.updateGameDetails(
            updateGameDetailsParams: tUpdateGameDetailsParams,
          ),
          completes,
        );

        verify(
          () => mockCustomHttpClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kUpdateGameEndpoint/${tUpdateGameDetailsParams.gameObjectId}',
            ),
            body: {
              'name': tUpdateGameDetailsParams.gameName,
            },
            header: {
              'Authorization': 'Bearer ${tUpdateGameDetailsParams.userToken}',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.postRequest(
            any(),
            body: any(named: 'body'),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Invalid ID format',
            500,
          ),
        );

        final methodCall = gameDetailsDataSourceImpl.updateGameDetails;

        expect(
          () => methodCall(
            updateGameDetailsParams: tUpdateGameDetailsParams,
          ),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              contains('Invalid ID format'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kUpdateGameEndpoint/${tUpdateGameDetailsParams.gameObjectId}',
            ),
            body: {
              'name': tUpdateGameDetailsParams.gameName,
            },
            header: {
              'Authorization': 'Bearer ${tUpdateGameDetailsParams.userToken}',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });

  //download Game Images
  group('downloadGameImages', () {
    test(
      'should return [GameDetailsImageModel] when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
          ),
        ).thenAnswer(
          (_) async => http.Response.bytes(
            Uint8List(0),
            200,
            headers: {
              'Content-Type': '',
            },
          ),
        );

        final result = await gameDetailsDataSourceImpl.downloadGameImages(
          downloadGameImagesParams: tDownloadGameImagesParams,
        );

        expect(result, equals(tGameDetailsImageModel));

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseFileServerUrl:$testServerPort',
              '$kGameAssetsDownloadEndpoint/${tDownloadGameImagesParams.gameObjectId}/${tDownloadGameImagesParams.imageAssetName}',
            ),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'File Not Found',
            400,
          ),
        );

        final methodCall = gameDetailsDataSourceImpl.downloadGameImages;

        expect(
          () => methodCall(
            downloadGameImagesParams: tDownloadGameImagesParams,
          ),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              contains('File Not Found'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseFileServerUrl:$testServerPort',
              '$kGameAssetsDownloadEndpoint/${tDownloadGameImagesParams.gameObjectId}/${tDownloadGameImagesParams.imageAssetName}',
            ),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });

  //Upload Game Asset Images.
  group('uploadGameImages', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.setUri(
            any(),
            any(),
            any(),
          ),
        ).thenAnswer((_) async {});

        when(
          () => mockCustomHttpClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({'message': 'Image uploaded successfully'}),
            200,
          ),
        );

        await expectLater(
          gameDetailsDataSourceImpl.uploadGameImages(
            uploadGameImagesParams: tUploadGameImagesParams,
          ),
          completes,
        );

        verify(
          () => mockCustomHttpClient.setUri(
            Uri.https(
              '$baseFileServerUrl:$testServerPort',
              kGameAssetsUploadEndpoint,
            ),
            tUploadGameImagesParams.userToken,
            tUploadGameImagesParams.imageFile,
          ),
        ).called(1);

        verify(
          () => mockCustomHttpClient.sendRequest(),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.setUri(
            any(),
            any(),
            any(),
          ),
        ).thenAnswer((_) async {});

        when(
          () => mockCustomHttpClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.Response(
            'Error',
            400,
          ),
        );

        final methodCall = gameDetailsDataSourceImpl.uploadGameImages;

        await expectLater(
          () => methodCall(
            uploadGameImagesParams: tUploadGameImagesParams,
          ),
          throwsA(
            isA<ServerException>(),
          ),
        );

        verify(
          () => mockCustomHttpClient.setUri(
            Uri.https(
              '$baseFileServerUrl:$testServerPort',
              kGameAssetsUploadEndpoint,
            ),
            tUploadGameImagesParams.userToken,
            tUploadGameImagesParams.imageFile,
          ),
        ).called(1);

        verify(
          () => mockCustomHttpClient.sendRequest(),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });
}
