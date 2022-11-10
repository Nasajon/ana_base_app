// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:meutrabalhoapp/meu_trabalho_mobile.dart';
import 'package:skeleton/skeleton.dart';

///
/// Material app definition
///
class AnaBaseAppWidget extends StatefulWidget {
  /// Creates a [AnaBaseAppWidget]
  const AnaBaseAppWidget({Key? key}) : super(key: key);

  @override
  _AnaBaseAppWidgetState createState() => _AnaBaseAppWidgetState();
}

class _AnaBaseAppWidgetState extends ViewState<AnaBaseAppWidget, AuthNotifier> {
  @override
  void initState() {
    super.initState();

    if (kReleaseMode) {
      // Modular.setObservers([Log.analyticsObserver()]);
    }

    if (kDebugMode) {
      // Modular.setObservers([CustomRouterObserver()]);
    }

    Modular.setInitialRoute(Modular.initialRoute);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return ViewModelListener<AuthNotifier, AuthState>(
              viewModel: viewModel,
              listener: (context, state) {
                // if (state.session!.apikey != null) {
                // Nav.pushNamed(MeuTrabalhoRouting.home);
                // }
                // switch (state.session!.apikey) {

                //   case '1':
                //     Nav.pushNamed(SkeletonRouting.multaList);

                //     break;
                //   case '2':
                //     Nav.pushNamed(MeuTrabalhoRouting.home);

                //     break;
                //   default:
                // }

                // Nav.navigate(MeuTrabalhoRouting.home);
                // state.maybeWhen(
                //   orElse: () {
                //     Nav.navigate(AuthModuleRouting.root);
                //   },
                //   authenticated: () {
                //     Nav.navigate(AppConfiguration.environment.homeRoute);
                //   },
                //   unauthenticated: (String reason, BasePath? redirectUrl) {
                //     Nav.navigate(AuthModuleRouting.root);
                //   },
                // );
              },
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                // title: DM.get<Environment>().appName,
                theme: ThemeFactory.light(),
                // darkTheme: ThemeFactory.light(),
                routeInformationParser: Modular.routeInformationParser,
                routerDelegate: Modular.routerDelegate,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('pt', 'BR'),
                ],
                locale: const Locale('pt', 'BR'),
              ),
            );
          },
        );
      },
    );
  }
}
