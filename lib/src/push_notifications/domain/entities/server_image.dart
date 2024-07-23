import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'server_image.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class ServerImage with ServerImageMappable {
  const ServerImage({
    this.imageData,
    this.imageType,
  });

  ServerImage.empty()
      : this(
          imageData: Uint8List(0),
          imageType: '',
        );

  final Uint8List? imageData;
  final String? imageType;
}
