import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/forgot_pass/check_your_mail_screen.dart';
import 'package:flutter_app/ui/pages/forgot_pass/forgot_pass_screen.dart';
import 'package:flutter_app/ui/pages/home/base_screen.dart';
import 'package:flutter_app/ui/pages/login/login_screen.dart';
import 'package:flutter_app/ui/pages/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../ui/pages/splash/splash_screen.dart';

class HomeArguments {
  final String title;
  final int number;

  const HomeArguments({required this.title, required this.number});
}

class CameraArguments {
  final CameraDescription camera;

  const CameraArguments({required this.camera});
}

class MyRouter {
  static const String splash = '/splash';
  static const String setting = '/setting';

  //DOC
  static const String homeScreen = '/home-screen';
  static const String login = '/login';
  static const String forgotPassword = "/forgot-password";
  static const String checkYourMail = "/check-your-mail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen(title: settings.arguments, number: null,));
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassScreen());
      case checkYourMail:
        return MaterialPageRoute(builder: (_) => const CheckYourMailScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
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
