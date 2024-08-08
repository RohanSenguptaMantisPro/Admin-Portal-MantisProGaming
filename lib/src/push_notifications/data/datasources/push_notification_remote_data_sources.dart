import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/global_error_handler.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/notification_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/server_image_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:flutter/foundation.dart';
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
    required CustomHttpClient customHttpClient,
  }) : _customHttpClient = customHttpClient;

  final CustomHttpClient _customHttpClient;

  @override
  Future<void> imageUpload({
    required String userToken,
    required XFile imageFile,
  }) async {
    try {
      await _customHttpClient.setMultipartRequest(
        uri: Uri.https(
          '$baseFileServerUrl:$testServerPort',
          kNotificationImageUploadEndpoint,
        ),
        userToken: userToken,
        files: {'image': imageFile},
      );

      final response = await _customHttpClient.sendRequest();

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not upload image',
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint(
          '---PUSH NOTIFICATION DATA SOURCE : [imageUpload] :ERROR: $e ');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<ServerImageModel> imageDownload({
    required String userToken,
    required String fileName,
  }) async {
    try {
      final response = await _customHttpClient.getRequest(
        Uri.https(
          '$baseFileServerUrl:$testServerPort',
          '$kNotificationImageDownloadEndpoint/$fileName',
        ),
        header: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not download & preview image',
        );
      }

      return ServerImageModel.fromResponse(
        response.bodyBytes,
        response.headers['Content-Type'],
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint(
          '---PUSH NOTIFICATION DATA SOURCE : [imageDownload] :ERROR: $e ');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<NotificationResponse> sendNotifications({
    required String userToken,
    required String title,
    required String body,
    required String fileName,
  }) async {
    try {
      final imageUrl =
          'https://$baseFileServerUrl:$testServerPort$kNotificationImageDownloadEndpoint/$fileName';
      debugPrint(imageUrl);

      final response = await _customHttpClient.postRequest(
        Uri.https(
          '$baseUrl:$testServerPort',
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
        throw GlobalErrorHandler.handleErrorResponse(
          response,
          'Could not send notification',
        );
      }

      return NotificationResponseModel.fromJson(response.body);
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint(
          '---PUSH NOTIFICATION DATA SOURCE : [sendNotifications] :ERROR: $e ');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
