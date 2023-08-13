import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/forgot_pass_bloc/forgot_pass_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/utils/validation_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  late TextEditingController emailTextController;
  late ForgotPassBloc forgotPassBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPassBloc = BlocProvider.of<ForgotPassBloc>(context);
    emailTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPassBloc, ForgotPassState>(
      bloc: forgotPassBloc,
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              controller: emailTextController,
              validator: (value) {
                if (value != null && !value.isValidEmail) {
                  return AppLocalizations.of(context)!.emailMustFollow;
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.focused)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).hintColor;
                    return bodyLarge(context)!
                        .copyWith(color: color, fontSize: 20);
                  }),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      borderRadius:
                          BorderRadius.circular(StyleConst.defaultRadius15)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConst.lightGrey),
                      borderRadius:
                          BorderRadius.circular(StyleConst.defaultRadius15)),
                  hintText: 'Ex: abc@gmail.com',
                  hintStyle:
                      const TextStyle(color: ColorConst.textFieldHintColor)),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding12,
            ),
            Visibility(
              visible: state is ForgotPassError,
              child: Text(
                state is ForgotPassError
                    ? AppLocalizations.of(context)!.sendResetPassFail
                    : "",
                style: bodyLargeBold(context)?.copyWith(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      elevation: 2,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              StyleConst.defaultRadius15))),
                  onPressed: state is ForgotPassLoading
                      ? null
                      : () {
                          if (widget.formKey.currentState!.validate()) {
                            forgotPassBloc.add(ForgotPassEvent(
                                emailTextController.text.trim()));
                          }
                        },
                  child: Center(
                    child: state is ForgotPassLoading
                        ? const SizedBox(
                            height: StyleConst.defaultPadding24,
                            width: StyleConst.defaultPadding24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.sendReset,
                            style: bodyLargeBold(context)
                                ?.copyWith(fontSize: 18, color: Colors.white),
                          ),
                  )),
            )
          ],
        );
      },
    );
  }
}
