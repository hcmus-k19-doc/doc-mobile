import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget(
      {Key? key,
      required this.rotationValue,
      required this.radiusValue,
      required this.width,
      required this.height,
      required this.colorWidget,
      required this.imagePath})
      : super(key: key);

  final double rotationValue, radiusValue;
  final double width, height;
  final Color? colorWidget;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationValue,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: const EdgeInsets.only(bottom: StyleConst.defaultPadding12),
        decoration: BoxDecoration(
          color: colorWidget,
          borderRadius: BorderRadius.circular(radiusValue),
          // boxShadow: [
          //   BoxShadow(
          //       color: colorWidget!.withOpacity(0.8),
          //       offset: const Offset(-6.0, -6.0)),
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       offset: const Offset(6.0, 6.0)),
          // ]
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
