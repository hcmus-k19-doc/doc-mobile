import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class MenuTile extends StatelessWidget {
  final String parentTitle;
  final List<Widget> subMenu;

  const MenuTile({Key? key, required this.parentTitle, required this.subMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            parentTitle,
            style: headLineSmall(context),
          ),
          childrenPadding:
              const EdgeInsets.only(left: StyleConst.defaultPadding24),
          children: subMenu,
        ));
  }
}
