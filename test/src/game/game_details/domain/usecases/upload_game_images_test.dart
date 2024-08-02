import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/upload_game_images.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailsRepo extends Mock implements GameDetailsRepo {}

void main() {
  late GameDetailsRepo gameDetailsRepo;
  late UploadGameImages uploadGameImages;

  setUp(() {
    gameDetailsRepo = MockGameDetailsRepo();
    uploadGameImages = UploadGameImages(gameDetailsRepo);

    registerFallbackValue(
      UploadGameImagesParams.empty(),
    );
  });

  final tUploadGameImagesParams = UploadGameImagesParams.empty();

  test(
    'should call the [GameDetailsRepo.uploadGameImages]',
    () async {
      when(
        () => gameDetailsRepo.uploadGameImages(
          uploadGameImagesParams: any(named: 'uploadGameImagesParams'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await uploadGameImages(
        tUploadGameImagesParams,
      );

      expect(
        result,
        equals(
          const Right<dynamic, void>(null),
        ),
      );

      verify(
        () => gameDetailsRepo.uploadGameImages(
          uploadGameImagesParams: tUploadGameImagesParams,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameDetailsRepo);
    },
  );
}
