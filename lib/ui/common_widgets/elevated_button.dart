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
        return filledElevated(context);
      case ButtonType.outlinedButton:
        return outlinedElevated(context);
      case ButtonType.filledWhiteButton:
        return filledWhiteElevated(context);
      default:
        return filledElevated(context);
    }
  }

  ElevatedButton outlinedElevated(BuildContext context) {
    Widget child;
    if (icon == null) {
      child = childWidgetText(context);
    } else {
      child = childWidgetTextAndIcon(context);
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        foregroundColor: ColorConst.primaryBlue,
        backgroundColor: Colors.white,
        shape: StadiumBorder(
            side: BorderSide(
          width: 1,
          color: ColorConst.primaryBlue,
        )),
      ),
      onPressed: callback,
      child: child,
    );
  }

  Widget childWidgetText(BuildContext context) {
    return Text(title, style: bodyLarge(context));
  }

  Widget childWidgetTextAndIcon(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: bodyLarge(context),
      ),
      Icon(icon)
    ]);
  }

  ElevatedButton filledWhiteElevated(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorConst.primaryBlue,
        textStyle: const TextStyle(),
        padding: const EdgeInsets.all(16),
        elevation: 2,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConst.primaryBlue, width: 1),
            borderRadius: BorderRadius.circular(radius)),
      ),
      onPressed: callback,
      child: Text(title, style: bodyLarge(context)),
    );
  }

  ElevatedButton filledElevated(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      onPressed: callback,
      child:
          Text(title, style: bodyLarge(context)?.copyWith(color: Colors.white)),
    );
  }
}
