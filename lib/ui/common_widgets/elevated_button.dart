import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final double radius;
  final String buttonType;
  final IconData? icon;

  const CustomElevatedButton({
    super.key,
    required this.callback,
    required this.title,
    required this.radius,
    required this.buttonType,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.filledButton:
        return filledElevated();
      case ButtonType.outlinedButton:
        return outlinedElevated();
      case ButtonType.filledWhiteButton:
        return filledWhiteElevated();
      default:
        return filledElevated();
    }
  }

  ElevatedButton outlinedElevated() {
    Widget child;
    if (icon == null) {
      child = childWidgetText();
    } else {
      child = childWidgetTextAndIcon();
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(
            side: BorderSide(
          width: 1,
          color: Colors.blue,
        )),
      ),
      onPressed: callback,
      child: child,
    );
  }

  Widget childWidgetText() {
    return Text(title);
  }

  Widget childWidgetTextAndIcon() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Icon(icon)]);
  }

  ElevatedButton filledWhiteElevated() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          textStyle: const TextStyle(),
          padding: const EdgeInsets.all(16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(radius)),),
      onPressed: callback,
      child: Text(title),
    );
  }

  ElevatedButton filledElevated() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      onPressed: callback,
      child: Text(title),
    );
  }
}
