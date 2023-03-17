import 'package:flutter/material.dart';
import 'package:flutter_app/ui/common_widgets/menu_tile.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key, required this.onNewDrawerIndex}) : super(key: key);
  Function onNewDrawerIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MenuTile(parentTitle: "VĂN BẢN ĐẾN", subMenu: [
            ListTile(
              title: Text("DANH SÁCH VB ĐẾN"),
              onTap: () {
                onClickDrawer(0, "Danh sách văn bản đến", context);
              },
            ),
            ListTile(
              title: Text("XỬ LÝ VB ĐẾN"),
              onTap: () {
                onClickDrawer(1, "Testing page", context);
              },
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

  void onClickDrawer(int drawerIndex, String titlePage, BuildContext context)
  {
    onNewDrawerIndex(drawerIndex, titlePage);
    Navigator.pop(context);
  }
}


