import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CustomHttpClient {
  CustomHttpClient({required this.httpClient});

  final http.Client httpClient;
  late http.MultipartRequest request;

  Future<void> setMultipartRequest({
    required Uri uri,
    required String userToken,
    Map<String, String>? fields,
    Map<String, XFile>? files,
  }) async {
    request = http.MultipartRequest('POST', uri);

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
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
          entry.key,
          bytes,
          filename: entry.value.name,
        );
        request.files.add(multipartFile);
      }
    }
  }

  Future<http.Response> sendRequest() async {
    final streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    return response;
  }

  Future<http.Response> getRequest(Uri uri,
      {Map<String, String>? header}) async {
    debugPrint('--------[CustomHttpClient] : [getRequest] : URI: $uri');
    final response = await httpClient.get(uri, headers: header);
    return response;
  }

  Future<http.Response> postRequest(
    Uri uri, {
    Map<String, String>? header,
    Object? body,
  }) async {
    final response = await httpClient.post(
      uri,
      headers: header,
      body: body,
    );
    return response;
  }
}
