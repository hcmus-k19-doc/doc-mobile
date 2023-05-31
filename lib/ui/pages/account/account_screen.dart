import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/common_widgets/confirm_dialog.dart';
import 'package:flutter_app/ui/pages/account/widgets/list_tile_with_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/utils.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.defaultPadding20),
        child: Column(
          children: [
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.mainPage("MY_PROFILE"),
                icon: Icons.person,
                onPress: () {
                  Navigator.of(context).pushNamed(MyRouter.profile);
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.mainPage("SETTINGS"),
                icon: Icons.settings,
                onPress: () {
                  Navigator.of(context).pushNamed(MyRouter.setting);
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.logout,
                icon: Icons.logout,
                onPress: () {
                  onPressedLogOut(context, MediaQuery.of(context).size);
                }),
          ],
        ),
      ),
    );
  }

  void onPressedLogOut(BuildContext context, Size size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            size: size,
            content: "Bạn có muốn đăng xuất?",
            title: 'Đăng xuất',
            onRightButton: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              pushUntilLogin(context);
            },
            onLeftButton: () {
              Navigator.of(context).pop();
            },
            leftButton: 'Huỷ bỏ',
            rightButton: 'Thoát',
            hasLeftButton: true,
          );
        });
  }
}
