import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/models/user_details_model.dart';
import 'package:flutter/foundation.dart';

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
    required CustomHttpClient httpClient,
  }) : _httpClient = httpClient;

  final CustomHttpClient _httpClient;

  @override
  Future<UserDetailsModel> getUserDetails({
    required String userToken,
    required String userID,
  }) async {
    try {
      final response = await _httpClient.getRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kGetUserDetailsEndpoint/$userID',
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not fetch user details',
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

      final extractedUserData = jsonEncode(userData);

      return UserDetailsModel.fromJson(extractedUserData);
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint('---USER DETAILS DATA SOURCE : [getUserDetails] :ERROR: $e');
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
      final response = await _httpClient.postRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
          '$kUpdateUserDetailsEndpont/$userID',
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
        body: {
          'accountStatus': accountStatus,
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not update user details',
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint(
          '---USER DETAILS DATA SOURCE : [updateUserDetails] :ERROR: $e');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
