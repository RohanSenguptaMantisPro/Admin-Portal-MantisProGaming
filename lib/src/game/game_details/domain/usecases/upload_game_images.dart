import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_game_images.mapper.dart';

class UploadGameImages extends UsecaseWithParams<void, UploadGameImagesParams> {
  const UploadGameImages(this._repo);

  final GameDetailsRepo _repo;

  @override
  ResultFuture<void> call(UploadGameImagesParams params) =>
      _repo.uploadGameImages(uploadGameImagesParams: params);
}

@MappableClass(discriminatorKey: 'type')
class UploadGameImagesParams with UploadGameImagesParamsMappable {
  const UploadGameImagesParams({
    required this.userToken,
    required this.imageFile,
    required this.imageAssetName,
    required this.gameObjectId,
  });

  UploadGameImagesParams.empty()
      : this(
          userToken: '',
          imageFile: XFile(''),
          imageAssetName: '',
          gameObjectId: '',
        );

  final String userToken;
  final XFile imageFile;
  final String imageAssetName;
  final String gameObjectId;
}
