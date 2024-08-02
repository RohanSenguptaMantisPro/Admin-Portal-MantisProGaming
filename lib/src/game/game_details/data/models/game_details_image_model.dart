import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_details_image_model.mapper.dart';

@MappableClass(discriminatorValue: 'gameDetailsImageModel')
class GameDetailsImageModel extends GameDetailsImage
    with GameDetailsImageModelMappable {
  const GameDetailsImageModel({
    super.imageData,
    super.imageType,
  });

  GameDetailsImageModel.empty()
      : super(
          imageData: Uint8List(0),
          imageType: '',
        );

  static GameDetailsImageModel fromResponse(
    Uint8List? imageData,
    String? imageType,
  ) {
    return GameDetailsImageModel(
      imageData: imageData,
      imageType: imageType,
    );
  }
}
