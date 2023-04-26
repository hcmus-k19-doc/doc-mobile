import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/profile/widgets/title_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.defaultPadding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextFieldWidget(
              title: "${AppLocalizations.of(context)!.name}*",
              initialText: 'John Doe',
              isTextFieldEnable: true,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding16,
            ),
            TitleTextFieldWidget(
              title: AppLocalizations.of(context)!.username,
              initialText: 'user1',
              isTextFieldEnable: false,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding16,
            ),
            const TitleTextFieldWidget(
              title: "Email",
              initialText: 'user1@gmail.com',
              isTextFieldEnable: false,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding16,
            ),
            TitleTextFieldWidget(
              title: AppLocalizations.of(context)!.userID,
              initialText: '123x321',
              isTextFieldEnable: false,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding16,
            ),
            TitleTextFieldWidget(
              title: AppLocalizations.of(context)!.role,
              initialText: 'Trưởng phòng',
              isTextFieldEnable: false,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius15))),
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
