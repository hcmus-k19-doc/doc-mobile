import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/app/router.dart';

ThemeMode getDeviceThemeMode() {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  if (brightness == Brightness.light) {
    return ThemeMode.light;
  } else {
    return ThemeMode.dark;
  }
}

//Heigh x 5 lines + padding = 16x2
double getDescriptionHeight(BuildContext context) {
  double textHeight =
      Theme.of(context).textTheme.bodyLarge?.fontSize?.toDouble() ?? 14;
  return textHeight * ConstValue.descriptionTextScale * 5 + 16 * 2;
}

double getMaxLineHeightByLines(BuildContext context, int lines) {
  double textHeight =
      Theme.of(context).textTheme.bodyLarge?.fontSize?.toDouble() ?? 14;
  return textHeight * ConstValue.descriptionTextScale * lines + 16 * 2;
}

void pushUntilLogin(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, MyRouter.login, (route) => false);
}
