import 'package:flutter/material.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'my_app.dart';
import 'router.dart';
import 'config.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  WidgetsFlutterBinding.ensureInitialized();
  String? accessToken = await SecuredLocalStorage().readString(KEY_CONST.ACCESS_TOKEN_KEY);
  runApp(
    AppConfig(
      appName: "DOC",
        debugTag: true,
        initialRoute: MyRouter.login,
        baseUrl: "http://localhost:8080/api/v1",
        child: MyApp(accessToken: accessToken,)),
  );
}
