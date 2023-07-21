import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class ListTileWithBorder extends StatelessWidget {
  const ListTileWithBorder(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: StyleConst.defaultPadding20),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(StyleConst.defaultPadding20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(StyleConst.defaultRadius15),
              color: Theme.of(context).colorScheme.onPrimary,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.black26,
                ),
              ]),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: StyleConst.defaultPadding8,
              ),
              Text(
                title,
                style: bodyLarge(context),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
