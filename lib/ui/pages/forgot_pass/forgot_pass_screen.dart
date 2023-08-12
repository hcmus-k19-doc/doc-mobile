import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/forgot_pass/widget/forgot_pass_form.dart';
import 'package:flutter_app/utils/validation_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forgotPass.substring(
              0, AppLocalizations.of(context)!.forgotPass.length - 1),
          style: headLineSmall(context)?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.resetPass,
                style: bodyLargeBold(context)?.copyWith(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: StyleConst.defaultPadding8,
                    top: StyleConst.defaultPadding8),
                child: Text(
                  AppLocalizations.of(context)!.detailForgotPass,
                  style: bodyLarge(context)
                      ?.copyWith(fontSize: 18, color: Colors.grey[700]),
                ),
              ),
              const SizedBox(
                height: StyleConst.defaultPadding24,
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
