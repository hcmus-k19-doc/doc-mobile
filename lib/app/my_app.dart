import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/main.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../constants/export_constants.dart';
import '../constants/themes.dart';
import '../utils/utils.dart';
import 'config.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorConst.primaryBlue),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                  AuthRepository(
                      "${UrlConst.DOC_SERVICE_URL}/security/auth/token"),
                  UserRepository("${UrlConst.DOC_SERVICE_URL}/users"))),
        ],
        child: ChangeNotifierProvider(
            create: (context) => SettingsProvider(),
            child: Consumer<SettingsProvider>(
                builder: (context, model, child) => _buildMyApp(context))),
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
        theme:
            Provider.of<SettingsProvider>(context).themeMode == ThemeMode.light
                ? ThemeData(fontFamily: 'Roboto', colorScheme: lightTheme())
                : ThemeData(fontFamily: 'Roboto', colorScheme: darkTheme()),
        themeMode: getDeviceThemeMode(),
        onGenerateRoute: MyRouter.generateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Provider.of<SettingsProvider>(context).locale,
        navigatorKey: navigatorKey,
        // navigatorObservers: [routeObserver],
        initialRoute: config.initialRoute.toString());
  }
}
