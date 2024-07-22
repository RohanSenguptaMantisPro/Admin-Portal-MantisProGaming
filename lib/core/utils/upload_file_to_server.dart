import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart' as path;

class UploadFileToServer {
  final _httpClient = Client();

  late MultipartRequest request;

  // create instance with URI setup.
  Future<void> setUri(
    Uri uri,
    String userToken,
    File imageFile,
  ) async {
    request = MultipartRequest('POST', uri);

    // Add authorization header
    request.headers['Authorization'] = 'Bearer $userToken';

    // Add the file to the request
    MultipartFile multipartFile = await MultipartFile.fromPath(
      'image', // This should match the key expected by your server
      imageFile.path,
      filename: path.basename(imageFile.path),
    );

    request.files.add(multipartFile);
  }

  //send request with form data.
  Future<StreamedResponse> sendRequest() {
    return request.send();
  }

  //send get request.
  Future<Response> getRequest(Uri uri, {Map<String, String>? header}) async {
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
