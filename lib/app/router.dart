import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/base/base_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/check_your_mail_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/forgot_pass_screen.dart';
import 'package:flutter_app/ui/pages/incoming_document_detail/inc_doc_detail_screen.dart';
import 'package:flutter_app/ui/pages/login/login_screen.dart';
import 'package:flutter_app/ui/pages/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../ui/pages/home/home_screen.dart';
import '../ui/pages/splash/splash_screen.dart';

class HomeArguments {
  final String title;
  final int number;

  const HomeArguments({required this.title, required this.number});
}

class IncomingDocumentDetailArgs {
  final int documentId;

  const IncomingDocumentDetailArgs({required this.documentId});
}

class MyRouter {
  static const String home = 'home';
  static const String splash = '/splash';
  static const String setting = '/setting';

  //DOC
  static const String baseScreen = '/base-screen';
  static const String login = '/login';
  static const String forgotPassword = "/forgot-password";
  static const String checkYourMail = "/check-your-mail";
  static const String incomingDocumentDetail = "/incoming-document-detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case home:
        if (args is HomeArguments) {
          String mTitle = args.title;
          int mNumber = args.number;
          return MaterialPageRoute(
              builder: (_) => HomeScreen(title: mTitle, number: mNumber),
              settings: RouteSettings(name: home, arguments: settings.arguments));
        } else {
          return errorRoute("Input for Home is not ScreenArguments");
        }
      case baseScreen:
        return MaterialPageRoute(builder: (_) => const BaseScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassScreen());
      case checkYourMail:
        return MaterialPageRoute(builder: (_) => const CheckYourMailScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case incomingDocumentDetail:
        if (args is IncomingDocumentDetailArgs) {
          int mId = args.documentId;
          return MaterialPageRoute(
              builder: (_) => IncomingDocumentDetail(documentId: mId),
              settings: RouteSettings(name: incomingDocumentDetail, arguments: settings.arguments));
        } else {
          return errorRoute("Input for incomingDocumentDetail is not IncomingDocumentDetailArgs");
        }
      default:
        return errorRoute("No route-name founded");
    }
  }

  static Route<dynamic> errorRoute(String errorMsg) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for $errorMsg'),
              ),
            ));
  }
}
