import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

ThemeMode getDeviceThemeMode() {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  if (brightness == Brightness.light) {
    return ThemeMode.light;
  } else {
    return ThemeMode.dark;
  }
}
