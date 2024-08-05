import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class CustomHttpClient {
  final _httpClient = Client();

  late MultipartRequest request;

  // create instance with URI setup.
  Future<void> setUri(
    Uri uri,
    String userToken,
    XFile imageFile,
  ) async {
    request = MultipartRequest('POST', uri);

    Uint8List bytes = await imageFile.readAsBytes();

    // Add authorization header
    request.headers['Authorization'] = 'Bearer $userToken';

    // Add the file to the request
    MultipartFile multipartFile = MultipartFile.fromBytes(
      'image', // This should match the key expected by your server
      bytes,
      filename: imageFile.name,
    );
    request.headers['Content-Type'] = 'multipart/form-data';

    request.files.add(multipartFile);
  }

  //send request with form data.
  Future<Response> sendRequest() async {
    final streamedResponse = await request.send();
    Response response = await Response.fromStream(streamedResponse);
    return response;
  }

  //send get request.
  Future<Response> getRequest(Uri uri, {Map<String, String>? header}) async {
    debugPrint('--------[CustomHttpClient] : [getRequest] : URI :$uri');

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
