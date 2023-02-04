import 'package:flutter/material.dart';
import 'my_app.dart';
import 'router.dart';
import 'config.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    //nay cung duoc nhma hoi roi
    //ve co ban la cho MyApp chia vao AppConfig InheritedWidget de lay cai value ra thoi
    const AppConfig(
      appName: "DOC",
        debugTag: true,
        initialRoute: MyRouter.login,
        baseUrl: "http://localhost:8080/api/v1",
        child: MyApp()),
  );
}
