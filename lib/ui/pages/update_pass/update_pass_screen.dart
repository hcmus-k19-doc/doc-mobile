import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/update_pass_bloc/update_pass_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/update_pass/widgets/text_form_change_pass.dart';
import 'package:flutter_app/utils/validation_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePassScreen extends StatefulWidget {
  const UpdatePassScreen({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  State<UpdatePassScreen> createState() => _UpdatePassScreenState();
}

class _UpdatePassScreenState extends State<UpdatePassScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final _formValidateKey = GlobalKey<FormState>();
  late UpdatePassBloc updatePassBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.text = widget.username;
    updatePassBloc = BlocProvider.of<UpdatePassBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePassBloc, UpdatePassState>(
      bloc: updatePassBloc,
      listener: (context, state) {
        if (state is UpdatePassSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.changePassword,
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
                    AppLocalizations.of(context)!.changePassword,
                    style: headLineSmall(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: StyleConst.defaultPadding8,
                        top: StyleConst.defaultPadding8),
                    child: Text(
                      AppLocalizations.of(context)!.needChanged,
                      style: bodyLarge(context)
                          ?.copyWith(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  Form(
                      key: _formValidateKey,
                      child: Column(
                        children: [
                          TextFormChangePass(
                            title: AppLocalizations.of(context)!.username,
                            textController: usernameController,
                            isEnable: false,
                            isObscureText: false,
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding16,
                          ),
                          TextFormChangePass(
                            title:
                                AppLocalizations.of(context)!.currentPassword,
                            textController: currentPasswordController,
                            isEnable: true,
                            isObscureText: true,
                            validator: (value) {
                              if (value != null && value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .plsInputValid;
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding16,
                          ),
                          TextFormChangePass(
                            title: AppLocalizations.of(context)!.newPassword,
                            textController: newPasswordController,
                            isEnable: true,
                            isObscureText: true,
                            validator: (value) {
                              if (value != null && value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .plsInputValid;
                              } else if (!value!.isValidPassword) {
                                return AppLocalizations.of(context)!
                                    .invalidPassword;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding16,
                          ),
                          TextFormChangePass(
                            title: AppLocalizations.of(context)!
                                .confirmNewPassword,
                            textController: confirmNewPasswordController,
                            isEnable: true,
                            isObscureText: true,
                            validator: (value) {
                              if (value != null && value.trim().isEmpty) {
                                return AppLocalizations.of(context)!
                                    .plsInputValid;
                              } else if (value != newPasswordController.text) {
                                return AppLocalizations.of(context)!
                                    .passConfirmPassNotMatch;
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
                        onPressed: state is UpdatePassLoading
                            ? null
                            : () {
                                bool tempValid =
                                    _formValidateKey.currentState!.validate();
                                if (tempValid) {
                                  updatePassBloc.add(UpdatePassEvent(
                                      usernameController.text,
                                      currentPasswordController.text.trim(),
                                      confirmNewPasswordController.text.trim(),
                                      newPasswordController.text.trim()));
                                }
                              },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    StyleConst.defaultRadius15))),
                        child: state is UpdatePassLoading
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
