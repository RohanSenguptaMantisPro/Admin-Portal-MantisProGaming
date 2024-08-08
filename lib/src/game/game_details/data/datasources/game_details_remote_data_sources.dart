import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/data/models/game_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:flutter/material.dart';

abstract class GameDetailsRemoteDataSource {
  const GameDetailsRemoteDataSource();

  Future<GameDetailsModel> getGameDetails({
    required GetGameDetailsParams getGameDetailsParams,
  });

  Future<void> updateGameDetails({
    required UpdateGameDetailsParams updateGameDetailsParams,
  });

  Future<GameDetailsImageModel> downloadGameImages({
    required DownloadGameImagesParams downloadGameImagesParams,
  });

  Future<void> uploadGameImages({
    required UploadGameImagesParams uploadGameImagesParams,
  });
}

class GameDetailsRemoteDataSourceImpl implements GameDetailsRemoteDataSource {
  const GameDetailsRemoteDataSourceImpl({
    required CustomHttpClient customHttpClient,
  }) : _customHttpClient = customHttpClient;

  final CustomHttpClient _customHttpClient;

  @override
  Future<GameDetailsModel> getGameDetails({
    required GetGameDetailsParams getGameDetailsParams,
  }) async {
    try {
      final response = await _customHttpClient.getRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kGetGameEndpoint/${getGameDetailsParams.gameObjectId}',
        ),
        header: {
          'Authorization': 'Bearer ${getGameDetailsParams.userToken}',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not fetch game details');
      }

      debugPrint(response.body.toString());

      final extractedUserData = jsonEncode(
        (jsonDecode(response.body) as Map<String, dynamic>)['data'],
      );

      return GameDetailsModel.fromJson(extractedUserData);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---GAME DETAILS REMOTE DATA SOURCE : [getGameDetails] :ERROR: $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<void> updateGameDetails({
    required UpdateGameDetailsParams updateGameDetailsParams,
  }) async {
    try {
      final response = await _customHttpClient.postRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kUpdateGameEndpoint/${updateGameDetailsParams.gameObjectId}',
        ),
        body: {
          'name': updateGameDetailsParams.gameName,
        },
        header: {
          'Authorization': 'Bearer ${updateGameDetailsParams.userToken}',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not update game details');
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---GAME DETAILS REMOTE DATA SOURCE : [updateGameDetails] :ERROR: $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<GameDetailsImageModel> downloadGameImages({
    required DownloadGameImagesParams downloadGameImagesParams,
  }) async {
    try {
      final response = await _customHttpClient.getRequest(
        Uri.https(
          '$baseFileServerUrl:$testServerPort',
          '$kGameAssetsDownloadEndpoint/${downloadGameImagesParams.gameObjectId}/${downloadGameImagesParams.imageAssetName}',
        ),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not download game image');
      }

      return GameDetailsImageModel.fromResponse(
        response.bodyBytes,
        response.headers['Content-Type'],
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---GAME DETAILS REMOTE DATA SOURCE : [downloadGameImages] :ERROR: $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<void> uploadGameImages({
    required UploadGameImagesParams uploadGameImagesParams,
  }) async {
    try {
      await _customHttpClient.setMultipartRequest(
        uri: Uri.https(
          '$baseFileServerUrl:$testServerPort',
          kGameAssetsUploadEndpoint,
        ),
        userToken: uploadGameImagesParams.userToken,
        files: {'image': uploadGameImagesParams.imageFile},
        fields: {
          'imgAssetName': uploadGameImagesParams.imageAssetName,
          'gameObjId': uploadGameImagesParams.gameObjectId,
        },
      );

      final response = await _customHttpClient.sendRequest();

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not upload game image');
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---GAME DETAILS REMOTE DATA SOURCE : [uploadGameImages] :ERROR: $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
