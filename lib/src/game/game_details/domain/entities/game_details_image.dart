import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'game_details_image.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class GameDetailsImage with GameDetailsImageMappable {
  const GameDetailsImage({
    this.imageData,
    this.imageType,
  });

  GameDetailsImage.empty()
      : this(
    imageData: Uint8List(0),
    imageType: '',
  );

  final Uint8List? imageData;
  final String? imageType;
}
