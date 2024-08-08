
enum GameImageType {
  capsule,
  wideCapsule,
  logo,
  icon,
  hero,
}

extension GameImageTypeExtension on GameImageType {
  String get value {
    switch (this) {
      case GameImageType.capsule:
        return 'Capsule';
      case GameImageType.wideCapsule:
        return 'Wide Capsule';
      case GameImageType.logo:
        return 'Logo';
      case GameImageType.icon:
        return 'Icon';
      case GameImageType.hero:
        return 'Hero';
    }
  }

  String get apiValue {
    switch (this) {
      case GameImageType.capsule:
        return 'capsule';
      case GameImageType.wideCapsule:
        return 'wideCapsule';
      case GameImageType.logo:
        return 'logo';
      case GameImageType.icon:
        return 'icon';
      case GameImageType.hero:
        return 'hero';
    }
  }
}
