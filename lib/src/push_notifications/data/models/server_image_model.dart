import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'server_image_model.mapper.dart';

@MappableClass(discriminatorValue: 'serverImageModel')
class ServerImageModel extends ServerImage with ServerImageModelMappable {
  const ServerImageModel({
    super.imageData,
    super.imageType,
  });

  ServerImageModel.empty()
      : super(
          imageData: Uint8List(0),
          imageType: '',
        );

  static ServerImageModel fromResponse(
    Uint8List? bodyBytes,
    String? imageType,
  ) {
    return ServerImageModel(
      imageData: bodyBytes,
      imageType: imageType,
    );
  }
}
