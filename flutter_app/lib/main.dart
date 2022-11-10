import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'app/my_router.dart';
import 'app_config.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const AppConfig(
      appName: "DOC",
        debugTag: true,
        initialRoute: MyRouter.splash,
        child: MyApp()),
  );
}
