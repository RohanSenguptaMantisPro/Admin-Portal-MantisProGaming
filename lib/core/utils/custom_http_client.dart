import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class CustomHttpClient {
  final _httpClient = Client();
  late MultipartRequest request;

  Future<void> setMultipartRequest({
    required Uri uri,
    required String userToken,
    Map<String, String>? fields,
    Map<String, XFile>? files,
  }) async {
    request = MultipartRequest('POST', uri);

    // Add authorization header
    request.headers['Authorization'] = 'Bearer $userToken';
    request.headers['Content-Type'] = 'multipart/form-data';

    // Add fields
    if (fields != null) {
      request.fields.addAll(fields);
    }

    // Add files
    if (files != null) {
      for (var entry in files.entries) {
        Uint8List bytes = await entry.value.readAsBytes();
        MultipartFile multipartFile = MultipartFile.fromBytes(
          entry.key,
          bytes,
          filename: entry.value.name,
        );
        request.files.add(multipartFile);
      }
    }
  }

  Future<Response> sendRequest() async {
    final streamedResponse = await request.send();
    Response response = await Response.fromStream(streamedResponse);
    return response;
  }

  Future<Response> getRequest(Uri uri, {Map<String, String>? header}) async {
    debugPrint('--------[CustomHttpClient] : [getRequest] : URI: $uri');
    final response = await _httpClient.get(uri, headers: header);
    return response;
  }

  Future<Response> postRequest(
      Uri uri, {
        Map<String, String>? header,
        Object? body,
      }) async {
    final response = await _httpClient.post(
      uri,
      headers: header,
      body: body,
    );
    return response;
  }
}