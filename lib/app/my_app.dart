import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_doc_bloc.dart';
import 'package:flutter_app/bloc/pagination_list_incoming_bloc/pagination_list_incoming_bloc.dart';
import 'package:flutter_app/constants/hex_color.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/themes.dart';
import '../utils/utils.dart';
import 'config.dart';
import '../constants/export_constants.dart';
import 'router.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
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
      // child: MultiRepositoryProvider(
      //   providers: [
      //     RepositoryProvider<UserRepository>(
      //         create: (context) => UserRepository(config.baseUrl)),
      //     //
      //   ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(AuthRepository(
                  "${UrlConst.DOC_SERVICE_URL}/security/auth/token"))),
          BlocProvider(
              create: (context) => PaginationListIncomingBloc(
                  IncomingDocumentRepository(
                      "${UrlConst.DOC_SERVICE_URL}/incoming-documents"),
                  SearchCriteria())),
        ],
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
        theme: ThemeData(fontFamily: 'Roboto', colorScheme: lightTheme()),
        darkTheme: ThemeData(fontFamily: 'Roboto', colorScheme: darkTheme()),
        themeMode: getDeviceThemeMode(),
        onGenerateRoute: MyRouter.generateRoute,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('en'), // English
          Locale('vi'), // Spanish
        ],
        navigatorKey: navigatorKey,
        // navigatorObservers: [routeObserver],
        initialRoute: config.initialRoute.toString());
  }
}
