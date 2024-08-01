import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/download_game_images.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailsRepo extends Mock implements GameDetailsRepo {}

void main() {
  late GameDetailsRepo gameDetailsRepo;
  late DownloadGameImages downloadGameImages;

  setUp(() {
    gameDetailsRepo = MockGameDetailsRepo();
    downloadGameImages = DownloadGameImages(gameDetailsRepo);

    registerFallbackValue(DownloadGameImagesParams.empty());
  });

  final tGameDetailsImage = GameDetailsImage.empty();
  final tDownloadGameImagesParams = DownloadGameImagesParams.empty();

  test(
    'should call the [GameDetailsRepo.downloadGameImages]',
    () async {
      when(
        () => gameDetailsRepo.downloadGameImages(
          downloadGameImagesParams: any(named: 'downloadGameImagesParams'),
        ),
      ).thenAnswer(
        (_) async => Right(tGameDetailsImage),
      );

      final result = await downloadGameImages(
        tDownloadGameImagesParams,
      );

      expect(
        result,
        equals(
          Right<dynamic, GameDetailsImage>(tGameDetailsImage),
        ),
      );

      verify(
        () => gameDetailsRepo.downloadGameImages(
          downloadGameImagesParams: tDownloadGameImagesParams,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameDetailsRepo);
    },
  );
}
