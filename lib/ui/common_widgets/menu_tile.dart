import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';

class MenuTile extends StatelessWidget {
  final String parentTitle;
  final List<Widget> subMenu;

  const MenuTile({Key? key, required this.parentTitle, required this.subMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
        child: ExpansionTile(
          title: Text("${parentTitle}",),
          childrenPadding: EdgeInsets.only(left: StyleConst.defaultPadding),
          children: subMenu,
        ));
  }
}
