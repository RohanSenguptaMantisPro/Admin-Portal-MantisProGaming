import 'dart:convert';
import 'dart:math';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/notification_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/server_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

abstract class PushNotificationRemoteDataSources {
  const PushNotificationRemoteDataSources();

  Future<void> imageUpload({
    required String userToken,
    required XFile imageFile,
  });

  Future<ServerImage> imageDownload({
    required String userToken,
    required String fileName,
  });

  Future<NotificationResponse> sendNotifications({
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

  //image upload.
  @override
  Future<void> imageUpload({
    required String userToken,
    required XFile imageFile,
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
        String errorMessage;
        try {
          // Attempt to parse as JSON
          final responseBody =
              response.body.isNotEmpty ? jsonDecode(response.body) : null;
          errorMessage = (responseBody?['message'] as String?) ??
              'Could not download & preview image';
        } catch (e) {
          // If JSON parsing fails, use some part of
          // the raw response body or a default message
          errorMessage = response.body.isNotEmpty
              ? 'Server error: ${response.body.substring(0, min(100, response.body.length))}...'
              : 'Could not upload image';
        }

        throw ServerException(
          message: errorMessage,
          statusCode: response.statusCode.toString(),
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(
          '---PUSH NOTIFICATION DATA SOURCE : [imageUpload] :ERROR: $e ');
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
          '$baseFileServerUrl:$port',
          '$kNotificationImageDownloadEndpoint/$fileName',
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint(
            '------- PUSH NOTIFICATION DATA SOURCE : [imageDownload] ERROR : ${response.body}');
        String errorMessage;
        try {
          // Attempt to parse as JSON
          final responseBody =
              response.body.isNotEmpty ? jsonDecode(response.body) : null;
          errorMessage = (responseBody?['message'] as String?) ??
              'Could not download & preview image';
        } catch (e) {
          // If JSON parsing fails, use some part of
          // the raw response body or a default message
          errorMessage = response.body.isNotEmpty
              ? 'Server error: ${response.body.substring(0, min(100, response.body.length))}...'
              : 'Could not download & preview image';
        }

        throw ServerException(
          message: errorMessage,
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
  Future<NotificationResponse> sendNotifications({
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
        debugPrint(
            '------- PUSH NOTIFICATION DATA SOURCE : [sendNotifications] ERROR : ${response.body}');

        String errorMessage;
        try {
          // Attempt to parse as JSON
          final responseBody =
              response.body.isNotEmpty ? jsonDecode(response.body) : null;
          errorMessage = (responseBody?['message'] as String?) ??
              'Could not download & preview image';
        } catch (e) {
          // If JSON parsing fails, use some part of
          // the raw response body or a default message
          errorMessage = response.body.isNotEmpty
              ? 'Server error: ${response.body.substring(0, min(100, response.body.length))}...'
              : 'Could not send notification';
        }

        throw ServerException(
          message: errorMessage,
          statusCode: response.statusCode.toString(),
        );
      }

      return NotificationResponseModel.fromJson(response.body);
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
