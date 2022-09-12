import 'dart:async';

import 'package:ana_base_app/ana_base_app_module.dart';
import 'package:ana_base_app/ana_base_app_widget.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';

class _AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Log.i('onChange(${bloc.runtimeType})', change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Log.e('onError(${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

/// Build main app with correct flavor
Future<void> bootstrap() async {
  if (kDebugMode) {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      Log.e('App error', details.exception, details.stack);
    };
  }
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureIntl();

    /// Set status bar color transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Bloc.observer = _AppBlocObserver();
    runApp(
      ModularApp(module: AnaBaseAppModule(), child: const AnaBaseAppWidget()),
    );
  }, (error, stackTrace) async {
    Log.e('App error', error, stackTrace);

    if (!kDebugMode) {
      // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  });
}

Future<void> _configureIntl() async {
  Intl.defaultLocale = 'pt_BR';
}
