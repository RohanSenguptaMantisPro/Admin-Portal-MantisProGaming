import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:flutter/foundation.dart';

abstract class GameSearchRemoteDataSources {
  const GameSearchRemoteDataSources();

  Future<GameSearchResponseModel> searchGames({
    required SearchGamesParams searchGamesParams,
  });
}

class GameSearchRemoteDataSourcesImpl implements GameSearchRemoteDataSources {
  const GameSearchRemoteDataSourcesImpl({
    required CustomHttpClient customHttpClient,
  }) : _customHttpClient = customHttpClient;

  final CustomHttpClient _customHttpClient;

  @override
  Future<GameSearchResponseModel> searchGames({
    required SearchGamesParams searchGamesParams,
  }) async {
    Map<String, dynamic> queryParameters = {
      'page': searchGamesParams.pageNumber,
      'limit': searchGamesParams.limit,
    };

    if (searchGamesParams.field.isNotEmpty) {
      queryParameters['field'] = searchGamesParams.field;
    }
    if (searchGamesParams.query.isNotEmpty) {
      queryParameters['query'] = searchGamesParams.query;
    }

    try {
      final response = await _customHttpClient.getRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          kGameSearchEndpoint,
          queryParameters,
        ),
        header: {
          'Authorization': 'Bearer ${searchGamesParams.userToken}',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not fetch game data',
        );
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      final gameData = receivedJson['data'] as List?;

      if (gameData == null || gameData.isEmpty) {
        throw ServerException(
          message: gameData?.isEmpty == true
              ? 'No Game Data Available'
              : 'Could not fetch data',
          statusCode: '505',
        );
      }

      debugPrint(receivedJson.toString());
      return GameSearchResponseModel.fromJson(
        response.body,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---GAME SEARCH REMOTE DATA SOURCE : [searchGames] :ERROR: $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
