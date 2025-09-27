import 'package:flutter/services.dart' show appFlavor;

enum Flavor { dev, production, staging }

Flavor getFlavor(String name) {
  switch (name) {
    case 'dev':
      return Flavor.dev;
    case 'production':
      return Flavor.production;
    case 'staging':
      return Flavor.staging;
    default:
      return Flavor.dev;
  }
}

class F {
  static Flavor selectedFlavor = Flavor.dev;

  static String get name => selectedFlavor.name;

  F() {
    String? flavor = appFlavor;
    if (flavor != null) {
      selectedFlavor = getFlavor(flavor);
    }
  }

  static String get title {
    switch (selectedFlavor) {
      case Flavor.dev:
        return 'Flashlight Cashier Dev';
      case Flavor.production:
        return 'Flashlight Cashier';
      case Flavor.staging:
        return 'Flashlight Cashier Staging';
    }
  }
}
