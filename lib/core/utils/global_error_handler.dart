// lib/core/error/error_handler.dart

import 'dart:convert';
import 'dart:math';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GlobalErrorHandler {
  static ServerException handleErrorResponse(
      http.Response response, String defaultMessage) {
    String errorMessage;
    try {
      final responseBody = (response.body).toString().isNotEmpty
          ? jsonDecode(response.body.toString())
          : null;
      errorMessage = (responseBody?['message'] as String?) ?? defaultMessage;
    } catch (e) {
      errorMessage = response.body.toString().isNotEmpty
          ? 'Server error: ${response.body.substring(0, min(100, response.body.toString().length))}...'
          : defaultMessage;
    }
    debugPrint('---------ERROR : ${response.body}');
    return ServerException(
      message: errorMessage,
      statusCode: response.statusCode.toString(),
    );
  }
}
