import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/firebase_notification_service.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'my_app.dart';
import 'router.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'config.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  MyApp.initSystemDefault();
  timeago.setLocaleMessages("vi", timeago.ViMessages());
  timeago.setLocaleMessages("en", timeago.EnMessages());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseNotificationService().initNotification();
  runApp(
    const AppConfig(
        appName: "DOC",
        debugTag: false,
        initialRoute: MyRouter.splash,
        baseUrl: "http://localhost:8080/api/v1",
        child: MyApp()),
  );
}
