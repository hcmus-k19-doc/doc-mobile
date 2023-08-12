import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckYourMailScreen extends StatelessWidget {
  const CheckYourMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(StyleConst.defaultRadius15)),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1)),
                    padding: const EdgeInsets.all(StyleConst.defaultPadding24),
                    child: Icon(
                      Icons.mark_email_unread,
                      color: Theme.of(context).colorScheme.primary,
                      size: 45,
                    )),
                const SizedBox(
                  height: StyleConst.defaultPadding24,
                ),
                Text(
                  AppLocalizations.of(context)!.checkYourMail,
                  style: bodyLargeBold(context)?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
                Text(
                  AppLocalizations.of(context)!.weSentNewPass,
                  textAlign: TextAlign.center,
                  style: bodyLarge(context)
                      ?.copyWith(fontSize: 18, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding24,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: StyleConst.defaultPadding24),
                        elevation: 2,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                StyleConst.defaultRadius15))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.backToLogin,
                      style: bodyLarge(context)
                          ?.copyWith(fontSize: 18, color: Colors.white),
                    )),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.didNotReceive,
                  style: bodyLarge(context)?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding8,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "${AppLocalizations.of(context)!.or} ",
                      style: bodyLarge(context)?.copyWith(fontSize: 14)),
                  TextSpan(
                      text: AppLocalizations.of(context)!.tryOtherMail,
                      style: bodyLarge(context)?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, MyRouter.forgotPassword);
                        })
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
