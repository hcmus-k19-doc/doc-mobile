import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';

class TextRow extends StatelessWidget {
  const TextRow({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: bodyLargeBold(context),
            )),
        Expanded(
            flex: 3,
            child: Text(
              content,
              style: bodyLarge(context),
            )),
      ],
    );
  }
}
