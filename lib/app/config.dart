import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required this.appName,
    required this.debugTag,
    required this.initialRoute,
    required Widget child,
  }) : super(key: key, child: child);

  final String appName;
  final String initialRoute;
  final bool debugTag;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
