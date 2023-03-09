import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constants/hex_color.dart';
import 'package:flutter_app/model/repositories/user_repository.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'config.dart';
import '../constants/export_constants.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.accessToken}) : super(key: key);
  final String? accessToken;

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
  final navigatorKey = GlobalKey<NavigatorState>(); //ko can lam
  late bool isLoggedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    isLoggedIn = widget.accessToken != null &&
        !JwtDecoder.isExpired(widget.accessToken!);
    if (!isLoggedIn) {
      await SecuredLocalStorage().deleteAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepository(config.baseUrl)),
          //
        ],
        // child: MultiBlocProvider(
        //     providers: [],
        child: _buildMyApp(context),
        // )
      ),
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
            primaryColor: HexColor("4FAFD1"),
            primaryColorDark: Colors.teal[900],
            primarySwatch: Colors.blue,
            focusColor: Colors.grey[850],
            disabledColor: Colors.grey[400],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.grey[800],
              textTheme: ButtonTextTheme.accent,
            ),
            primaryTextTheme: TextTheme(
              bodySmall: TextStyle(color: Colors.grey[700], fontSize: 10),
              bodyLarge: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(color: Colors.grey[700], fontSize: 12),
              titleMedium: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              titleSmall: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              titleLarge: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              labelLarge: TextStyle(color: Colors.grey[850], fontSize: 14),
            )),
        onGenerateRoute: MyRouter.generateRoute,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('en'), // English
          Locale('vi'), // Spanish
        ],
        navigatorKey: navigatorKey,
        // navigatorObservers: [routeObserver],
        initialRoute: isLoggedIn
            ? MyRouter.baseScreen
            : config.initialRoute.toString());
  }
}
