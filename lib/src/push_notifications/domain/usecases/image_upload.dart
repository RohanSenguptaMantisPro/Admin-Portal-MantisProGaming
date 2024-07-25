import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload.mapper.dart';

class ImageUpload extends UsecaseWithParams<void, ImageUploadParams> {
  const ImageUpload(this._repo);

  final PushNotificationRepo _repo;

  @override
  ResultFuture<void> call(ImageUploadParams params) => _repo.imageUpload(
        userToken: params.userToken,
        imageFile: params.imageFile,
      );
}

@MappableClass(discriminatorKey: 'type')
class ImageUploadParams with ImageUploadParamsMappable {
  const ImageUploadParams({
    required this.userToken,
    required this.imageFile,
  });

  ImageUploadParams.empty()
      : this(
          userToken: '',
          imageFile: XFile(''),
        );

  final String userToken;
  final XFile imageFile;
}
