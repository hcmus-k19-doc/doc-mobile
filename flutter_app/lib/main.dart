import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'app/my_router.dart';
import 'app_config.dart';

void main() {
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
