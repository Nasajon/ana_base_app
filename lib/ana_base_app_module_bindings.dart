import 'package:ana_base_app/app_configuration.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:meutrabalhoapp/meu_trabalho_mobile.dart';

/// Base app module bindings
class AnaBaseAppModuleBindings {
  ///
  /// Module bindings
  ///
  static List<Bind> get binds => [
        Bind.lazySingleton<Environment>((_) => AppConfiguration.environment),
        Bind<AppColorScheme>((_) => baseColorScheme),
        ..._infrastructure,
        ..._datasources,
        ..._repositories,
        ..._usecases,
        ..._viewModels,
      ];

  static List<Bind> get _infrastructure => [];

  static List<Bind> get _datasources => [
        Bind.lazySingleton<IMeuTrabalhoLocalDatasource>(
          (di) => MeuTrabalhoLocalDatasource(
            sharedPreferences: SharedPreferences.getInstance(),
          ),
        ),
      ];

  static List<Bind> get _repositories => [
        Bind.lazySingleton<IMeuTrabalhoRepository>(
          (i) => MeuTrabalhoRepository(
            meuTrabalhoLocalDatasource: i.get<IMeuTrabalhoLocalDatasource>(),
          ),
        ),
      ];

  static List<Bind> get _usecases => [
        Bind.lazySingleton<ILoadSessionUsecase>(
          (i) => LoadSessionUsecase(
            meuTrabalhoRepository: i.get<IMeuTrabalhoRepository>(),
          ),
        ),
        Bind.lazySingleton<ISaveSessionUsecase>(
          (i) => SaveSessionUsecase(
            meuTrabalhoRepository: i.get<IMeuTrabalhoRepository>(),
          ),
        ),
      ];

  static List<Bind> get _viewModels => [
        Bind.lazySingleton<AuthService>(
          (di) => AuthService(
            di.get<IMeuTrabalhoRepository>(),
            di.get<AuthNotifier>(),
          ),
        ),
        Bind.singleton<AuthNotifier>(
          (di) => AuthNotifier(
            meuTrabalhoRepository: di.get<IMeuTrabalhoRepository>(),
          ),
        ),
      ];
}
