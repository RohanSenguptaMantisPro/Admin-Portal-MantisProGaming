import 'dart:convert';
import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/server_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:flutter/cupertino.dart';

abstract class PushNotificationRemoteDataSources {
  const PushNotificationRemoteDataSources();

  Future<void> imageUpload({
    required String userToken,
    required File imageFile,
  });

  Future<ServerImage> imageDownload({
    required String userToken,
    required String fileName,
  });

  Future<void> sendNotifications({
    required String userToken,
    required String title,
    required String body,
    required String fileName,
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

  //image download.
  @override
  Future<ServerImageModel> imageDownload({
    required String userToken,
    required String fileName,
  }) async {
    try {
      //sending that file to server.
      final response = await _uploadFileToServer.getRequest(
        Uri.https(
          '$baseUrl:$port',
          '$kNotificationImageDownloadEndpoint/$fileName',
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final responseBody =
            response.body.isNotEmpty ? jsonDecode(response.body) : null;
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message:
              (responseBody['message'] ?? 'Could not download & preview image')
                  .toString(),
          statusCode: response.statusCode.toString(),
        );
      }

      return ServerImageModel.fromResponse(
        response.bodyBytes,
        response.headers['Content-Type'],
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

  //send notifications..
  @override
  Future<void> sendNotifications({
    required String userToken,
    required String title,
    required String body,
    required String fileName,
  }) async {
    try {
      final imageUrl =
          'https://$baseFileServerUrl:$port$kNotificationImageDownloadEndpoint/$fileName';
      debugPrint(imageUrl);

      //sending that file to server.
      final response = await _uploadFileToServer.postRequest(
        Uri.https(
          '$baseUrl:$port',
          kNotificationSendEndpoint,
        ),
        body: {
          'title': title,
          'body': body,
          'imageUrl': imageUrl,
        },
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final responseBody =
            response.body.isNotEmpty ? jsonDecode(response.body) : null;
        debugPrint('------- ServerException has occurred.');
        throw ServerException(
          message:
              (responseBody['message'] ?? 'Could not download & preview image')
                  .toString(),
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
