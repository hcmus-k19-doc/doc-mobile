
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/export_constants.dart';
import '../app_config.dart';
import '../model/repositories/user_repository.dart';
import '../pages/splash/splash_screen.dart';
import '../utils/local_preferences.dart';
import 'my_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: ColorConst.statusBar),
    );
  }

  static Widget runWidget() {
    final UserRepository userRepository =
    UserRepository(localPreferences: LocalPreferences());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (context) => userRepository),
      ],
      // child: MultiBlocProvider(
      //     providers: [],
      child: const MyApp(),
      // )
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
    return _buildGetMaterialApp(context);
  }
  final LocalPreferences _localPreferences = LocalPreferences();
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late Map<String, dynamic> _deviceData;

  MaterialApp _buildGetMaterialApp(BuildContext context) {
    final config = AppConfig.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: config?.debugTag ?? false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorConst.defaultColor,
        hoverColor: ColorConst.green,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: ColorConst.defaultColor),
        canvasColor: Colors.transparent,
        fontFamily: FontConst.SF_PRO_TEXT,
      ),
      navigatorKey: navigatorKey,
      initialRoute: config?.initialRoute.toString() ?? 'splash',
      routes: {
        'splash': (context) => const SplashScreen(title: 'Hehe',),
      },
      onGenerateRoute: MyRouter.generateRoute,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }

}
