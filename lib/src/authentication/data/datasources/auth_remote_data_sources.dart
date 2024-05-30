import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<String> createUser();

  Future<bool> isAdmin(String userToken);

  Future<void> cacheUserToken(String userToken);

  Future<bool> isUserLoggedIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required SharedPreferences prefs,
    required http.Client httpClient,
  })  : _prefs = prefs,
        _httpClient = httpClient;

  final SharedPreferences _prefs;
  final http.Client _httpClient;

  // final FirebaseAuth _authClient;
  // final FirebaseFirestore _cloudStoreClient;
  // final FirebaseStorage _dbClient;

  @override
  Future<String> createUser() async {
    // Call createUser endpoint.

    try {
      final response = await _httpClient.post(
        Uri.https(baseUrl, kCreateUserEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }

      final receivedJson = jsonDecode(response.body) as DataMap;
      return receivedJson['token'].toString();
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
  Future<bool> isAdmin(String userToken) async {
    try {
      // later to be configured according to the
      // isAdmin endpoint.
      final response = await _httpClient.get(
        Uri.https(baseUrl, kIsAdminEndpoint),
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
  Future<bool> isUserLoggedIn() async {
    try {
      return (_prefs.getString(kUserToken) != null) ? true : false;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
