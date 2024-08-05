import 'dart:convert';
import 'dart:math';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:flutter/cupertino.dart';

abstract class GameSearchRemoteDataSources {
  const GameSearchRemoteDataSources();

  Future<GameSearchResponseModel> searchGames({
    required String userToken,
    required String pageNumber,
    required String limit,
    required String field,
    required String query,
  });
}

class GameSearchRemoteDataSourcesImpl implements GameSearchRemoteDataSources {
  const GameSearchRemoteDataSourcesImpl({
    required CustomHttpClient customHttpClient,
  }) : _customHttpClient = customHttpClient;

  final CustomHttpClient _customHttpClient;

  @override
  Future<GameSearchResponseModel> searchGames({
    required String userToken,
    required String pageNumber,
    required String limit,
    required String field,
    required String query,
  }) async {
    Map<String, dynamic> queryParameters = {
      'page': pageNumber,
      'limit': limit,
    };

    if (field.isNotEmpty) {
      queryParameters['field'] = field;
    }
    if (query.isNotEmpty) {
      queryParameters['query'] = query;
    }

    try {
      final response = await _customHttpClient.getRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          kGameSearchEndpoint,
          queryParameters,
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        String errorMessage;
        try {
          final responseBody =
              response.body.isNotEmpty ? jsonDecode(response.body) : null;
          errorMessage = (responseBody?['message'] as String?) ??
              'Could not fetch game data';
        } catch (e) {
          errorMessage = response.body.isNotEmpty
              ? 'Server error: ${response.body.substring(0, min(100, response.body.length))}...'
              : 'Could not fetch game data';
        }

        throw ServerException(
          message: errorMessage,
          statusCode: response.statusCode.toString(),
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
