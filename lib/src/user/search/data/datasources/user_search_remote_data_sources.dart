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
    required int pageNumber,
    required int limit,
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
    required int pageNumber,
    required int limit,
    required String field,
    required String query,
    required String country,
    required String accountStatus,
  }) async {
    try {
      final response = await _httpClient.get(
        Uri.https(
          '$baseUrl:$port',
          kUserDetailsEndpoint,
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
      final userData = receivedJson['data']['data'];

      if (userData == null) {
        throw const ServerException(
          message: 'No User Data Available',
          statusCode: '505',
        );
      }

      debugPrint(receivedJson.toString());
      return UserSearchResponseModel.fromJson(
        jsonEncode(userData),
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
