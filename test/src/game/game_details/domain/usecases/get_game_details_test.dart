import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/repositories/game_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailsRepo extends Mock implements GameDetailsRepo {}

void main() {
  late GameDetailsRepo gameDetailsRepo;
  late GetGameDetails getGameDetails;

  setUp(() {
    gameDetailsRepo = MockGameDetailsRepo();
    getGameDetails = GetGameDetails(gameDetailsRepo);

    registerFallbackValue(GetGameDetailsParams.empty());
  });

  final tGameDetails = GameDetails.empty();
  final tGetGameDetailsParams = GetGameDetailsParams.empty();

  test(
    'should call the [GameDetailsRepo.getGameDetails]',
    () async {
      when(
        () => gameDetailsRepo.getGameDetails(
          getGameDetailsParams: any(named: 'getGameDetailsParams'),
        ),
      ).thenAnswer(
        (_) async => Right(tGameDetails),
      );

      final result = await getGameDetails(
        tGetGameDetailsParams,
      );

      expect(
        result,
        equals(
          Right<dynamic, GameDetails>(tGameDetails),
        ),
      );

      verify(
        () => gameDetailsRepo.getGameDetails(
          getGameDetailsParams: tGetGameDetailsParams,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameDetailsRepo);
    },
  );
}
