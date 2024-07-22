import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'image_download.mapper.dart';

class ImageDownload
    extends UsecaseWithParams<ServerImage, ImageDownloadParams> {
  const ImageDownload(this._repo);

  final PushNotificationRepo _repo;

  @override
  ResultFuture<ServerImage> call(ImageDownloadParams params) =>
      _repo.imageDownload(
        userToken: params.userToken,
        fileName: params.fileName,
      );
}

@MappableClass(discriminatorKey: 'type')
class ImageDownloadParams with ImageDownloadParamsMappable {
  const ImageDownloadParams({
    required this.userToken,
    required this.fileName,
  });

  ImageDownloadParams.empty()
      : this(
          userToken: '',
          fileName: '',
        );

  final String userToken;
  final String fileName;
}
