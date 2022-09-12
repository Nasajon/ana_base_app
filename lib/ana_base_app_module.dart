import 'package:flutter_dependencies/flutter_dependencies.dart';

import 'ana_base_app_module_bindings.dart';
import 'ana_base_app_module_routing.dart';

///
/// Ana Base app module definition
///
class AnaBaseAppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = AnaBaseAppModuleBindings.binds;

  @override
  final List<ModularRoute> routes = AnaBaseAppModuleRouting.routes;
}
