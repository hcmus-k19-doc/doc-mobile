import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/ui/pages/base/base_screen.dart';
import 'package:flutter_app/ui/pages/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../ui/pages/home/home_screen.dart';
import '../ui/pages/camera_screen.dart';
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
  static const String home = 'home';
  static const String splash = '/';
  static const String camera = 'camera';

  //DOC
  static const String baseScreen = 'base-screen';
  static const String login = 'login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen(title: settings.arguments, number: null,));
      case home:
        if (args is HomeArguments) {
          String mTitle = args.title;
          int mNumber = args.number;
          return MaterialPageRoute(
              builder: (_) => HomeScreen(title: mTitle, number: mNumber),
              settings:
                  RouteSettings(name: home, arguments: settings.arguments));
        } else {
          return errorRoute("Input for Home - routing is not ScreenArguments");
        }
      case camera:
        if (args is CameraArguments) {
          CameraDescription mCamera = args.camera;
          return MaterialPageRoute(
              builder: (_) => CameraScreen(camera: mCamera),
              settings:
                  RouteSettings(name: camera, arguments: settings.arguments));
        } else {
          return errorRoute(
              "Input for Camera - routing is not ScreenArguments");
        }
      case baseScreen:
        return MaterialPageRoute(
            builder: (_) => BaseScreen(title: "VĂN BẢN ĐẾN"));
      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );
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
