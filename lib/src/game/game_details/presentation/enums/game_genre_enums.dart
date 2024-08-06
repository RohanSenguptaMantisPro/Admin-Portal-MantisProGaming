enum GameGenre {
  sandbox,
  rts,
  shooters,
  moba,
  rpg,
  arpg,
  mmorpg,
  sports,
  racing,
  simulation,
  puzzlers,
  partyGames,
  actionAdventure,
  graphicAdventures,
  survivalAndHorror,
  platformer,
  fighting,
  stealth,
  survival,
  battleRoyale,
}

extension GameGenreExtension on GameGenre {
  String get value {
    switch (this) {
      case GameGenre.sandbox:
        return 'Sandbox';
      case GameGenre.rts:
        return 'RTS';
      case GameGenre.shooters:
        return 'Shooters';
      case GameGenre.moba:
        return 'MOBA';
      case GameGenre.rpg:
        return 'RPG';
      case GameGenre.arpg:
        return 'ARPG';
      case GameGenre.mmorpg:
        return 'MMORPG';
      case GameGenre.sports:
        return 'Sports';
      case GameGenre.racing:
        return 'Racing';
      case GameGenre.simulation:
        return 'Simulation';
      case GameGenre.puzzlers:
        return 'Puzzlers';
      case GameGenre.partyGames:
        return 'Party Games';
      case GameGenre.actionAdventure:
        return 'Action-adventure';
      case GameGenre.graphicAdventures:
        return 'Graphic adventures';
      case GameGenre.survivalAndHorror:
        return 'Survival and horror';
      case GameGenre.platformer:
        return 'Platformer';
      case GameGenre.fighting:
        return 'Fighting';
      case GameGenre.stealth:
        return 'Stealth';
      case GameGenre.survival:
        return 'Survival';
      case GameGenre.battleRoyale:
        return 'Battle Royale';
    }
  }

  String get apiValue {
    switch (this) {
      case GameGenre.sandbox:
        return 'sandbox';
      case GameGenre.rts:
        return 'rts';
      case GameGenre.shooters:
        return 'shooters';
      case GameGenre.moba:
        return 'moba';
      case GameGenre.rpg:
        return 'rpg';
      case GameGenre.arpg:
        return 'arpg';
      case GameGenre.mmorpg:
        return 'mmorpg';
      case GameGenre.sports:
        return 'sports';
      case GameGenre.racing:
        return 'racing';
      case GameGenre.simulation:
        return 'simulation';
      case GameGenre.puzzlers:
        return 'puzzlers';
      case GameGenre.partyGames:
        return 'party_games';
      case GameGenre.actionAdventure:
        return 'action_adventure';
      case GameGenre.graphicAdventures:
        return 'graphic_adventures';
      case GameGenre.survivalAndHorror:
        return 'survival_and_horror';
      case GameGenre.platformer:
        return 'platformer';
      case GameGenre.fighting:
        return 'fighting';
      case GameGenre.stealth:
        return 'stealth';
      case GameGenre.survival:
        return 'survival';
      case GameGenre.battleRoyale:
        return 'battle_royale';
    }
  }
}
