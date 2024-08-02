import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/update_game_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailsRepo extends Mock implements GameDetailsRepo {}

void main() {
  late GameDetailsRepo gameDetailsRepo;
  late UpdateGameDetails updateGameDetails;

  setUp(() {
    gameDetailsRepo = MockGameDetailsRepo();
    updateGameDetails = UpdateGameDetails(gameDetailsRepo);

    registerFallbackValue(const UpdateGameDetailsParams.empty());
  });

  const tUpdateGameDetailsParams = UpdateGameDetailsParams.empty();

  test(
    'should call the [GameDetailsRepo.updateGameDetails]',
    () async {
      when(
        () => gameDetailsRepo.updateGameDetails(
          updateGameDetailsParams: any(named: 'updateGameDetailsParams'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await updateGameDetails(
        tUpdateGameDetailsParams,
      );

      expect(
        result,
        equals(
          const Right<dynamic, void>(null),
        ),
      );

      verify(
        () => gameDetailsRepo.updateGameDetails(
          updateGameDetailsParams: tUpdateGameDetailsParams,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameDetailsRepo);
    },
  );
}
