import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/splash_screen.dart';

import 'app/my_app.dart';
import 'app/my_router.dart';
import 'app_config.dart';

void main() {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    AppConfig(
        appName: "HehePA",
        debugTag: false,
        flavorName: "dev",
        initialRoute: MyRouter.splash,
        child: MyApp.runWidget()),
  );
}
