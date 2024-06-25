import 'dart:async';
import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<String> googleSignInService();

  Future<String> createUser(DataMap jsonPayload);

  Future<bool> isAdmin(String userToken);

  Future<void> cacheUserToken(String userToken);

  Future<String> isUserLoggedIn();

  Future<AdminDetailsModel> fetchUserData(String userToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required SharedPreferences prefs,
    required http.Client httpClient,
    required GoogleSignIn googleSignIn,
  })  : _prefs = prefs,
        _httpClient = httpClient,
        _googleSignIn = googleSignIn;

  // _googleSignIn = googleSignIn

  final SharedPreferences _prefs;
  final http.Client _httpClient;
  final GoogleSignIn _googleSignIn;

  // final FirebaseAuth _authClient;
  // final FirebaseFirestore _cloudStoreClient;
  // final FirebaseStorage _dbClient;

  // google sign in
  // encrypt.
  // createUser as below with updates.

  @override
  Future<String> googleSignInService() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signInSilently();

      final GoogleSignInAuthentication googleUserAuthentication =
          await googleSignInAccount!.authentication;

      final userIdToken = googleUserAuthentication.idToken ?? '';
      if (userIdToken.isEmpty) {
        throw const ServerException(
          message: 'Could not retrieve userIdToken',
          statusCode: '505',
        );
      }

      return userIdToken;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint('------- [RemoteDataSource Error] : $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<String> createUser(DataMap jsonPayload) async {
    // Call createUser endpoint.
    debugPrint('------- Calling createUser Endpoint.');
    try {
      final response = await _httpClient.post(
        Uri.https('$baseUrl:$port', kCreateUserEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonPayload),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      debugPrint(receivedJson.toString());
      return receivedJson['token'].toString();
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint('------- [RemoteDataSource Error] : $e ');
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<bool> isAdmin(String userToken) async {
    try {
      // later to be configured according to the
      // isAdmin endpoint.
      final response = await _httpClient.get(
        Uri.https('$baseUrl:$port', kIsAdminEndpoint),
        headers: {
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
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }
      return false;
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
  Future<void> cacheUserToken(String userToken) async {
    try {
      await _prefs.setString(kUserToken, userToken);
    } catch (e) {
      throw CacheException(
        message: e.toString(),
        statusCode: '505',
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
      // later to be configured according to the
      // isAdmin endpoint.
      final response = await _httpClient.get(
        Uri.https('$baseUrl:$port', kGetUserDataEndpoint),
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
      return AdminDetailsModel.fromJson(
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
