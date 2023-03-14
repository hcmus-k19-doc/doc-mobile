import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';

class CheckYourMailScreen extends StatelessWidget {
  const CheckYourMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(StyleConst.defaultRadius)),
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    padding: const EdgeInsets.all(StyleConst.defaultPadding),
                    child: Icon(
                      Icons.mark_email_unread,
                      color: Theme.of(context).primaryColor,
                      size: 45,
                    )),
                const SizedBox(
                  height: StyleConst.defaultPadding,
                ),
                Text(
                  "Check your mail",
                  style: FontConst.SEMIBOLD_BLACK_24,
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding / 2,
                ),
                Text(
                  "We have sent a password recover\n"
                  "instructions to your email.",
                  textAlign: TextAlign.center,
                  style: FontConst.REGULAR_GRAY4.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: StyleConst.defaultPadding),
                        elevation: 2,
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                StyleConst.defaultRadius))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back to login",
                      style: FontConst.medium.copyWith(fontSize: 18),
                    )),
                const Spacer(),
                Text(
                  "Did not receive the email? Check your spam filter,",
                  style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding / 3,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "or ",
                      style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 14)),
                  TextSpan(
                      text: "try another email address",
                      style: FontConst.regular.copyWith(
                          fontSize: 14, color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        print("Send back email");
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
