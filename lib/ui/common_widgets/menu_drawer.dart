import 'package:flutter/material.dart';
import 'package:flutter_app/ui/common_widgets/menu_tile.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MenuTile(parentTitle: "VĂN BẢN ĐẾN", subMenu: [
            ListTile(
              title: Text("DANH SÁCH VB ĐẾN"),
              onTap: () {},
            ),
            ListTile(
              title: Text("XỬ LÝ VB ĐẾN"),
              onTap: () {},
            )
          ]),
          MenuTile(parentTitle: "VĂN BẢN ĐI", subMenu: [
            ListTile(
              title: Text("DANH SÁCH VB ĐI"),
              onTap: () {},
            ),
            ListTile(
              title: Text("XỬ LÝ VB ĐI"),
              onTap: () {},
            )
          ]),
        ],
      ),
    );
  }
}
