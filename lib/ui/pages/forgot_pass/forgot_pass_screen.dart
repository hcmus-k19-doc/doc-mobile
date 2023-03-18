import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/forgot_pass/widget/forgot_pass_form.dart';
import 'package:flutter_app/utils/validation_extension.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset pasword",
                style: bodyLarge(context),
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              Text(
                "Enter the email associated with your account and we'll send "
                "an email with instructions to reset your password.",
                style: bodyLarge(context),
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: StyleConst.defaultPadding / 2),
                child: Text(
                  "Email address",
                  style: bodyLarge(context),
                ),
              ),
              Form(
                  key: _formKey,
                  child: ForgotPassForm(
                    formKey: _formKey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
