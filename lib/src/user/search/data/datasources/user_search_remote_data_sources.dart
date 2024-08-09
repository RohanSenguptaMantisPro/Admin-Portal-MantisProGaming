import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class UserSearchRemoteDataSources {
  const UserSearchRemoteDataSources();

  Future<UserSearchResponseModel> userSearchResults({
    required String userToken,
    required String pageNumber,
    required String limit,
    required String field,
    required String query,
    required String country,
    required String accountStatus,
  });
}

class UserSearchDataSourceImpl implements UserSearchRemoteDataSources {
  const UserSearchDataSourceImpl({
    required CustomHttpClient httpClient,
  }) : _httpClient = httpClient;

  final CustomHttpClient _httpClient;

  @override
  Future<UserSearchResponseModel> userSearchResults({
    required String userToken,
    required String pageNumber,
    required String limit,
    required String field,
    required String query,
    required String country,
    required String accountStatus,
  }) async {
    Map<String, dynamic> queryParameters = {
      'page': pageNumber,
      'limit': limit,
      'country': country,
      'accountStatus': accountStatus,
    };

    if (field.isNotEmpty) {
      queryParameters['field'] = field;
    }
    if (query.isNotEmpty) {
      queryParameters['query'] = query;
    }

    try {
      final response = await _httpClient.getRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          kUserSearchEndpoint,
          queryParameters,
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not fetch user search results',
        );
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      final userData = receivedJson['data'] as List?;

      if (userData == null || userData.isEmpty) {
        throw ServerException(
          message: userData?.isEmpty == true
              ? 'No User Data Available'
              : 'Could not fetch data',
          statusCode: '505',
        );
      }

      return UserSearchResponseModel.fromJson(response.body);
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint('---USER SEARCH DATA SOURCE : [userSearchResults] :ERROR: $e');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
