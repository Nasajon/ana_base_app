import 'package:ana_base_app/ana_base_app_module_routing.dart';
import 'package:ana_base_app/presentation/views/home/viewmodels/ana_home_viewmodel.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:meutrabalhoapp/services/auth/auth_notifier.dart';
import 'package:meutrabalhoapp/services/auth/auth_service.dart';

import 'ana_home_page.dart';

/// Home module
class Home extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<AnaHomeViewModel>(
      (i) => AnaHomeViewModel(
        authNotifier: i.get<AuthNotifier>(),
      ),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AnaBaseAppModuleRouting.root.path,
          transition: TransitionType.noTransition,
          child: (_, __) => const AnaHomePage(),
          // children: [
          //   ModuleRoute(
          //     AnaBaseAppModuleRouting.meuTrabalhoRoot.path,
          //     module: MeuTrabalhoModule(),
          //     transition: TransitionType.noTransition,
          //   ),
          // ],
        ),
      ];
}
