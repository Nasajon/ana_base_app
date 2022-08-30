import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:meutrabalhoapp/meutrabalho_mobile.dart';
import 'package:meutrabalhoapp/widgets/app_widget/app_widget.dart';

import 'app_configuration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    await FormDataService.delete();
  }
  await FormDataService.load();

  // await AppConfiguration.loadFlavor(Flavor.dev);

  runApp(const AppWidget());
}
