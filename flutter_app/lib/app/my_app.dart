import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_config.dart';
import '../constants/export_constants.dart';
import '../model/repositories/user_repository.dart';
import '../utils/local_preferences.dart';
import 'my_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: ColorConst.statusBar),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final LocalPreferences localPreferences = LocalPreferences();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
            create: (context) =>
                UserRepository(localPreferences: localPreferences)),
      ],
      // child: MultiBlocProvider(
      //     providers: [],
      child: _buildMyApp(context),
      // )
    );
  }

  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late Map<String, dynamic> _deviceData;

  Widget _buildMyApp(BuildContext context) {
    final config = AppConfig.of(context)!;

    return MaterialApp(
        //Android
        title: config.appName,
        debugShowCheckedModeBanner: config.debugTag,
        theme: ThemeData(
            primaryColor: Colors.teal[600],
            primaryColorDark: Colors.teal[900],
            primarySwatch: Colors.blue,
            focusColor: Colors.grey[850],
            disabledColor: Colors.grey[400],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.grey[800],
              textTheme: ButtonTextTheme.accent,
            ),
            primaryTextTheme: TextTheme(
              caption: TextStyle(color: Colors.grey[700], fontSize: 10),
              bodyText1: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              bodyText2: TextStyle(color: Colors.grey[700], fontSize: 12),
              subtitle1: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              subtitle2: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              headline6: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              button: TextStyle(color: Colors.grey[850], fontSize: 14),
            )),
        onGenerateRoute: MyRouter.generateRoute,
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        navigatorKey: navigatorKey,
        // navigatorObservers: [routeObserver],
        initialRoute: config.initialRoute.toString());
  }
}
