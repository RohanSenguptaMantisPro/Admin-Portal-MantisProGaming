import 'dart:async';
import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_local_storage.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_signup_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<String> googleSignInService();

  Future<String> createUser(DataMap jsonPayload);

  Future<bool> isAdmin(String userToken);

  Future<void> cacheUserToken(String userToken);

  Future<String> isUserLoggedIn();

  Future<AdminDetailsModel> fetchUserData(String userToken);

  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required CustomLocalStorage prefs,
    required CustomHttpClient httpClient,
    required CustomSignUpClient customSignupClient,
  })  : _prefs = prefs,
        _customHttpClient = httpClient,
        _customSignupClient = customSignupClient;

  final CustomLocalStorage _prefs;
  final CustomHttpClient _customHttpClient;
  final CustomSignUpClient _customSignupClient;

  @override
  Future<String> googleSignInService() async {
    try {
      final userIdToken = await _customSignupClient.signInSilently();
      if (userIdToken.isEmpty) {
        throw const ServerException(
          message: 'Could not retrieve userIdToken',
          statusCode: '500',
        );
      }

      return userIdToken;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '------- [RemoteDataSource Error : googleSignInService: ] : $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }

  @override
  Future<String> createUser(DataMap jsonPayload) async {
    try {
      final response = await _customHttpClient.postRequest(
        Uri.https('$baseUrl:$testServerPort', kCreateUserEndpoint),
        header: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonPayload),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not create user');
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      return receivedJson['token'].toString();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint('------- [RemoteDataSource createUser Error] : $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }

  @override
  Future<bool> isAdmin(String userToken) async {
    try {
      final response = await _customHttpClient.getRequest(
        Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode == 401) {
        final receivedJson = jsonDecode(response.body) as DataMap;
        if (receivedJson['status'] == 'failure') {
          return false;
        }
      } else if (response.statusCode == 200) {
        final receivedJson = jsonDecode(response.body) as DataMap;
        if (receivedJson['status'] == 'success') {
          return true;
        }
      } else {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not check admin status');
      }
      return false;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }

  @override
  Future<void> cacheUserToken(String userToken) async {
    try {
      await _prefs.setString(kUserToken, userToken);
    } catch (e) {
      throw CacheException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }

  @override
  Future<String> isUserLoggedIn() async {
    try {
      final userToken = _prefs.getString(kUserToken);
      return (userToken != null) ? userToken : '';
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<AdminDetailsModel> fetchUserData(String userToken) async {
    try {
      final response = await _customHttpClient.getRequest(
        Uri.https('$baseUrl:$testServerPort', kGetAdminDataEndpoint),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
            response, 'Could not fetch user data');
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      final userData = receivedJson['data']['data'];

      if (userData == null) {
        throw const ServerException(
          message: 'No User Data Available',
          statusCode: '500',
        );
      }

      return AdminDetailsModel.fromJson(
        jsonEncode(userData),
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      final result = await _prefs.clear();

      if (result == false) {
        throw const CacheException(
          message: 'Could not log user out',
          statusCode: '500',
        );
      }
      await _customSignupClient.signOut();
      await _customSignupClient.disconnect();
    } on CacheException {
      rethrow;
    } catch (e) {
      throw CacheException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }
}
