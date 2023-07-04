import 'package:flutter/material.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'app/my_app.dart';
import 'app/router.dart';
import 'app/config.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const AppConfig(
        appName: "DOC",
        debugTag: false,
        initialRoute: MyRouter.splash,
        baseUrl: "http://localhost:8080/api/v1",
        child: MyApp()),
  );
}
