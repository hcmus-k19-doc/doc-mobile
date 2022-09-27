import 'package:flutter/material.dart';

import '../ui/screens/splash_screen.dart';

class MyRouter {
  static const String home = 'home';
  static const String splash = '/';
  static const String login = 'login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case login:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen(title: 'Hehe',));
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
