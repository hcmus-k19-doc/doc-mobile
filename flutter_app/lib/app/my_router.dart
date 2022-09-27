import 'package:flutter/material.dart';
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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    if (args is ScreenArguments) {
      switch (settings.name) {
        case splash:
          return MaterialPageRoute(
              builder: (_) => const SplashScreen(title: 'Flutter demo',));
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen(title: settings.arguments, number: null,));
        case home:
          String? mTitle = args.title;
          int? mNumber = args.number;
            return MaterialPageRoute(
                builder: (_) =>
                    HomeScreen(title: mTitle??"Hehe", number: mNumber??0),
                settings: RouteSettings(
                    name: home, arguments: settings.arguments));
        default:
          return errorRoute("No route-name founded");
      }
    }
    else {
      return errorRoute("Input for routing is not ScreenArguments");
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
