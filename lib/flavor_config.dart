import 'package:flutter_core/flutter_core.dart';

/// Configuration for Flavors
class FlavorConfig {
  /// The current [Flavor]
  static Flavor? appFlavor;

  /// Returns a tittle associated with the current [Flavor]
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Genial dev';
      case Flavor.hml:
        return 'Genial hml';
      case Flavor.prod:
        return 'Genial';
      default:
        return 'title';
    }
  }
}
