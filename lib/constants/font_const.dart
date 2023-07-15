import 'package:flutter/material.dart';
import 'package:flutter_app/constants/themes.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import 'export_constants.dart';

class DefaultColor {
  late Color fontColor = Colors.black;
  late Color backgroundColor = Colors.transparent;

  DefaultColor(BuildContext context) {
    if (Provider.of<SettingsProvider>(context).themeMode == ThemeMode.light) {
      fontColor = Colors.black;
      backgroundColor = Colors.transparent;
    } else {
      fontColor = Colors.white;
      backgroundColor = Colors.black;
    }
  }
}

TextStyle? bodyLarge(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w400,
      height: ConstValue.descriptionTextScale,
      color: DefaultColor(context).fontColor,
      backgroundColor: DefaultColor(context).backgroundColor);
}

TextStyle? bodyLargeItalic(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      height: ConstValue.descriptionTextScale,
      color: DefaultColor(context).fontColor,
      backgroundColor: DefaultColor(context).backgroundColor);
}

TextStyle? bodyLargeBold(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
      height: ConstValue.descriptionTextScale,
      color: DefaultColor(context).fontColor,
      backgroundColor: DefaultColor(context).backgroundColor);
}

TextStyle? headLineSmall(BuildContext context) {
  return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w500,
      height: ConstValue.descriptionTextScale,
      color: DefaultColor(context).fontColor,
      backgroundColor: DefaultColor(context).backgroundColor);
}

TextStyle? headLineMedium(BuildContext context) {
  return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w500,
      height: ConstValue.descriptionTextScale,
      color: DefaultColor(context).fontColor,
      backgroundColor: DefaultColor(context).backgroundColor);
}
