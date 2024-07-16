import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  final http.Client _httpClient;

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
    Map<String, dynamic> queryParameters;

    if (field.isEmpty) {
      queryParameters = {
        'page': pageNumber,
        'limit': limit,
        'query': query,
        'country': country,
        'accountStatus': accountStatus,
      };
    } else if (query.isEmpty) {
      queryParameters = {
        'page': pageNumber,
        'limit': limit,
        'field': field,
        'country': country,
        'accountStatus': accountStatus,
      };
    } else if (field.isEmpty && query.isEmpty) {
      queryParameters = {
        'page': pageNumber,
        'limit': limit,
        'country': country,
        'accountStatus': accountStatus,
      };
    } else {
      queryParameters = {
        'page': pageNumber,
        'limit': limit,
        'field': field,
        'query': query,
        'country': country,
        'accountStatus': accountStatus,
      };
    }

    try {
      final response = await _httpClient.get(
        Uri.https(
          '$baseUrl:$port',
          kUserDetailsEndpoint,
          queryParameters,
        ),
        headers: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      final userData = receivedJson['data'] as List?;

      if (userData == null || userData.isEmpty) {
        throw ServerException(
          message: (userData != null)
              ? userData.isEmpty
                  ? 'No User Data Available'
                  : 'Could not fetch data.'
              : 'Could not fetch data',
          statusCode: '505',
        );
      }

      debugPrint(receivedJson.toString());
      return UserSearchResponseModel.fromJson(
        response.body,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
