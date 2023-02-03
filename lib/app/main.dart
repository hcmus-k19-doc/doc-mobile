import 'package:flutter/material.dart';
import 'my_app.dart';
import 'router.dart';
import 'config.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const AppConfig(
      appName: "DOC",
        debugTag: true,
        initialRoute: MyRouter.splash,
        baseUrl: "http://localhost:8080/api/v1",
        child: MyApp()),
  );
}
