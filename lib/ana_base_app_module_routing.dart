import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:meutrabalhoapp/meu_trabalho_mobile.dart';
import 'package:meutrabalhoapp/meu_trabalho_module.dart';
import 'package:skeleton/skeleton.dart';

import 'ana_base_app_module.dart';
import 'presentation/views/home/ana_home_module.dart';

/// HomeRoutes
abstract class AnaBaseAppModuleRouting {
  /// module
  static const BasePath root = BasePath('/');

  static const BasePath home = BasePath('/home');

  /// Meu trabalho module
  static const BasePath meuTrabalhoRoot = BasePath('/meu-trabalho/home');

  ///
  /// Module routes definitions
  ///
  static List<ModularRoute> get routes => [
        // ChildRoute(
        //   root.path,
        //   child: (_, args) => const AnaHomePage(),
        //   transition: TransitionType.fadeIn,
        // ),
        ModuleRoute(
          root.path,
          module: Home(),
        ),
        ModuleRoute(
          home.path,
          module: Home(),
          // guards: [AsyncBindsGuard()],
        ),
        ModuleRoute(
          MeuTrabalhoRouting.root.path,
          module: MeuTrabalhoModule(),
          guards: [AsyncBindsGuard()],
        ),

        ModuleRoute(
          SkeletonRouting.root.path,
          module: SkeletonModule(),
          guards: [AsyncBindsGuard()],
        ),
      ];
}

/// Guard that protect module with async binds
class AsyncBindsGuard extends RouteGuard {
  /// Create instance for [AsyncBindsGuard]
  AsyncBindsGuard() : super();

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AnaBaseAppModule>();
    return true;
  }
}
