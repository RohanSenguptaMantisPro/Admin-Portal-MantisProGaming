import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class UserDetailsRemoteDataSources {
  const UserDetailsRemoteDataSources();

  Future<UserDetailsModel> getUserDetails({
    required String userToken,
    required String userID,
  });

  Future<void> updateUserDetails({
    required String userToken,
    required String userID,
    required String accountStatus,
  });
}

class UserDetailsDataScourceImpl implements UserDetailsRemoteDataSources {
  const UserDetailsDataScourceImpl({
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  final http.Client _httpClient;

  @override
  Future<UserDetailsModel> getUserDetails({
    required String userToken,
    required String userID,
  }) async {
    try {
      final response = await _httpClient.get(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kGetUserDetailsEndpoint/$userID',
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
      final userData = receivedJson['data'] as DataMap?;

      if (userData == null) {
        throw const ServerException(
          message: 'No User Data Available',
          statusCode: '505',
        );
      }

      final extractedUserData = jsonEncode(
        (jsonDecode(response.body) as Map<String, dynamic>)['data'],
      );

      debugPrint(receivedJson.toString());
      return UserDetailsModel.fromJson(extractedUserData);
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

  @override
  Future<void> updateUserDetails({
    required String userToken,
    required String userID,
    required String accountStatus,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kUpdateUserDetailsEndpont/$userID',
        ),
        headers: {
          'Authorization': 'Bearer $userToken',
        },
        body: {
          'accountStatus': accountStatus,
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }
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
