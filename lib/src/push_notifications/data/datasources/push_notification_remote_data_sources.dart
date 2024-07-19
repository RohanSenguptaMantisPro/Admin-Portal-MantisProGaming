import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:flutter/cupertino.dart';

abstract class PushNotificationRemoteDataSources {
  const PushNotificationRemoteDataSources();

  Future<void> imageUpload({
    required String userToken,
    required File imageFile,
  });
}

class PushNotificationRemoteDataSourcesImpl
    implements PushNotificationRemoteDataSources {
  const PushNotificationRemoteDataSourcesImpl({
    required UploadFileToServer uploadFileToServer,
  }) : _uploadFileToServer = uploadFileToServer;

  final UploadFileToServer _uploadFileToServer;

  @override
  Future<void> imageUpload({
    required String userToken,
    required File imageFile,
  }) async {
    try {
      //setting up file & uri to send to server as form-data.
      await _uploadFileToServer.setUri(
        Uri.https(
          '$baseFileServerUrl:$port',
          kNotificationImageUploadEndpoint,
        ),
        userToken,
        imageFile,
      );

      //sending that file to server.
      final response = await _uploadFileToServer.sendRequest();

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message: 'Could not upload image.',
          statusCode: response.statusCode.toString(),
        );
      }
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
