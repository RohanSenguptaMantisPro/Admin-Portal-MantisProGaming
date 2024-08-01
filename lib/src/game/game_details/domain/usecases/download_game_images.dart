import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'download_game_images.mapper.dart';

class DownloadGameImages
    extends UsecaseWithParams<GameDetailsImage, DownloadGameImagesParams> {
  const DownloadGameImages(this._repo);

  final GameDetailsRepo _repo;

  @override
  ResultFuture<GameDetailsImage> call(DownloadGameImagesParams params) =>
      _repo.downloadGameImages(downloadGameImagesParams: params);
}

@MappableClass(discriminatorKey: 'type')
class DownloadGameImagesParams with DownloadGameImagesParamsMappable {
  const DownloadGameImagesParams({
    required this.gameObjectId,
    required this.imageAssetName,
  });

  DownloadGameImagesParams.empty()
      : this(
          gameObjectId: '',
          imageAssetName: '',
        );

  final String gameObjectId;
  final String imageAssetName;
}
