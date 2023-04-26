import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/ui/common_widgets/menu_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key, required this.onNewDrawerIndex})
      : super(key: key);
  final Function onNewDrawerIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MenuTile(
              parentTitle: AppLocalizations.of(context)!.mainPage("LABEL"),
              subMenu: [
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!
                        .mainPage("INCOMING_DOCUMENT_LIST"),
                    style: bodyLarge(context),
                  ),
                  onTap: () {
                    onClickDrawer(0, "INCOMING_DOCUMENT_LIST", context);
                  },
                ),
                ListTile(
                  title: Text(
                    "Testing Screen",
                    style: bodyLarge(context),
                  ),
                  onTap: () {
                    onClickDrawer(1, "Testing Screen", context);
                  },
                )
              ]),
          const Divider(
            thickness: 1,
          ),
          MenuTile(
              parentTitle:
                  AppLocalizations.of(context)!.mainPage("OUTGOING_DOCUMENT"),
              subMenu: [
                ListTile(
                  title: Text(
                    "DANH SÁCH VB ĐI",
                    style: bodyLarge(context),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "XỬ LÝ VB ĐI",
                    style: bodyLarge(context),
                  ),
                  onTap: () {},
                )
              ]),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              AppLocalizations.of(context)!.mainPage("MY_PROFILE"),
              style: bodyLargeBold(context)?.copyWith(height: 0),
            ),
            onTap: () {
              onClickDrawer(2, "MY_PROFILE", context);
            },
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              AppLocalizations.of(context)!.logout,
              style: bodyLargeBold(context)?.copyWith(height: 0),
            ),
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            },
          )
        ],
      ),
    );
  }

  void onClickDrawer(int drawerIndex, String titlePage, BuildContext context) {
    onNewDrawerIndex(drawerIndex, titlePage);
    Navigator.pop(context);
  }
}
