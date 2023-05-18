import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/change_pass/change_pass_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/change_pass/widgets/title_textformfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final _formValidateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ChangePassBloc changePassBloc =
        BlocProvider.of<ChangePassBloc>(context);
    return BlocConsumer<ChangePassBloc, ChangePassState>(
      bloc: changePassBloc,
      listener: (context, state) {
        if (state is ChangePassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Change password successfully",
                style: bodyLarge(context)!.copyWith(color: Colors.white),
              ),
            ),
          );
        }
        if (state is ChangePassFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.errorMessage,
                style: bodyLarge(context)!.copyWith(color: Colors.white),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(StyleConst.defaultPadding20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.changePassword,
                    style: headLineSmall(context),
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  Form(
                      key: _formValidateKey,
                      child: Column(
                        children: [
                          TitleTextFormField(
                            title:
                                AppLocalizations.of(context)!.currentPassword,
                            textController: currentPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please input value";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding16,
                          ),
                          TitleTextFormField(
                            title: AppLocalizations.of(context)!.newPassword,
                            textController: newPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please input value";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding16,
                          ),
                          TitleTextFormField(
                            title: AppLocalizations.of(context)!
                                .confirmNewPassword,
                            textController: confirmNewPasswordController,
                            validator: (value) {
                              if (value != newPasswordController.text) {
                                return "Password and confirm password don't match";
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: state is ChangePassLoading
                            ? null
                            : () {
                                bool tempValid =
                                    _formValidateKey.currentState!.validate();
                                if (tempValid) {
                                  changePassBloc.add(ChangePassEvent(
                                      newPasswordController.text,
                                      currentPasswordController.text));
                                }
                              },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    StyleConst.defaultRadius15))),
                        child: state is ChangePassLoading
                            ? const SizedBox(
                                height: StyleConst.defaultPadding24,
                                width: StyleConst.defaultPadding24,
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : Text(
                                AppLocalizations.of(context)!.changePassword,
                                style: bodyLargeBold(context)!
                                    .copyWith(color: Colors.white, height: 0),
                              )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
