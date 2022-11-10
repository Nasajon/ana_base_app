import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';

import 'flavor_config.dart';

///
/// App configurations
///
class AppConfiguration {
  ///
  /// Set flavor configuration
  ///
  static Future<void> loadFlavor(Flavor currentFlavor) async {
    FlavorConfig.appFlavor = currentFlavor;

    await _loadEnv();

    Log.i('App started with ${FlavorConfig.appFlavor} flavor');
  }

  static Future<void> _loadEnv() async {
    var suffix = FlavorConfig.appFlavor!.name;
    suffix = suffix == Flavor.prod.name ? '' : '.$suffix';

    await dotenv.load(fileName: '.env/.env$suffix');
  }

  static Environment get environment {
    ThemeVersion themeVersion = dotenv.get('THEME_VERSION') == '2.0'
        ? ThemeVersion.v2
        : ThemeVersion.v1;

    return Environment(
      appName: FlavorConfig.title,
      flavor: FlavorConfig.appFlavor,
      themeVersion: themeVersion,
    );
  }
}
