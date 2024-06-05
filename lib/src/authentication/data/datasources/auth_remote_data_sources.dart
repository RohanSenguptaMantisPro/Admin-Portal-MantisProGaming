import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui';

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
    debugPrint('------- Calling createUser Endpoint.');
    try {
      final response = await _httpClient.get(
        Uri.https('$baseUrl:$port', kCreateUserEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200 && response.statusCode != 302) {
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode.toString(),
        );
      }

      // // Step 2: Open the URL in a new browser tab
      // debugPrint('https://$baseUrl:$port$kCreateUserEndpoint');
      // final newWindow =
      //     html.window.open('https://$baseUrl:$port$kCreateUserEndpoint', 'OAuth');
      //
      // // Step 3: Wait for JWT Token
      // final completer = Completer<String>();
      //
      // // Listen for a message from the new window
      // html.window.onMessage.listen((event) {
      //   if (event.data != null && event.data is String) {
      //     // Complete the Completer with the JWT token
      //     completer.complete(event.data as String);
      //     // Close the new window
      //     newWindow.close();
      //   }
      // });
      //
      // // Wait until the Completer's Future completes
      // final response = await completer.future;
      // debugPrint(response);

      final receivedJson = jsonDecode(response as String) as DataMap;
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
  Future<bool> isUserLoggedIn() async {
    try {
      return (_prefs.getString(kUserToken) != null) ? true : false;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
