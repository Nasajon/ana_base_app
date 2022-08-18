import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meutrabalhoapp/meutrabalho_mobile.dart';
import 'package:meutrabalhoapp/widgets/app_widget/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    await FormDataService.delete();
  }
  await FormDataService.load();
  runApp(const AppWidget());
}
