import 'package:flutter/material.dart';
import '../pages/camera_screen.dart';
import '../pages/home/home_screen.dart';
import '../pages/splash/splash_screen.dart';

class ScreenArguments{
  final String? title;
  final int? number;
  const ScreenArguments({this.title, this.number});
}

class MyRouter {
  static const String home = 'home';
  static const String splash = '/';
  static const String login = 'login';
  static const String camera = 'camera';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
      switch (settings.name) {
        case splash:
          return MaterialPageRoute(
              builder: (_) => const SplashScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen(title: settings.arguments, number: null,));
        case home:
          if (args is ScreenArguments) {
            String? mTitle = args.title;
            int? mNumber = args.number;
            return MaterialPageRoute(
                builder: (_) =>
                    HomeScreen(title: mTitle ?? "Missing title", number: mNumber ?? 0),
                settings: RouteSettings(
                    name: home, arguments: settings.arguments));
          } else {
            return errorRoute("Input for Home - routing is not ScreenArguments");
          }
        case camera:
          return MaterialPageRoute(
              builder: (_) => const CameraScreen());
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
