import 'package:flutter/material.dart';
import 'package:flutter_app/ui/common_widgets/menu_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key, required this.onNewDrawerIndex})
      : super(key: key);
  final Function onNewDrawerIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MenuTile(
              parentTitle: AppLocalizations.of(context)!.mainPage("LABEL"),
              subMenu: [
                ListTile(
                  title: Text(AppLocalizations.of(context)!
                      .mainPage("INCOMING_DOCUMENT_LIST")),
                  onTap: () {
                    onClickDrawer(0, "INCOMING_DOCUMENT_LIST", context);
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!
                      .mainPage("PROCESSES_INCOMING_DOCUMENT")),
                  onTap: () {
                    onClickDrawer(1, "PROCESSES_INCOMING_DOCUMENT", context);
                  },
                )
              ]),
          MenuTile(
              parentTitle:
                  AppLocalizations.of(context)!.mainPage("OUTGOING_DOCUMENT"),
              subMenu: [
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

  void onClickDrawer(int drawerIndex, String titlePage, BuildContext context) {
    onNewDrawerIndex(drawerIndex, titlePage);
    Navigator.pop(context);
  }
}
