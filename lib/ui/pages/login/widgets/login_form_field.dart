import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField(
      {Key? key,
      required this.usernameTextEditingController,
      required this.passwordTextEditingController})
      : super(key: key);
  final TextEditingController usernameTextEditingController,
      passwordTextEditingController;

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder(
        bloc: authBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: widget.usernameTextEditingController,
                validator: (value) {
                  // if (value != null && !value.isValidEmail) {
                  //   return 'Email must follow standard format';
                  // } else {
                  //   return null;
                  // }
                  return null; //Fix this later
                },
                enabled: state is AuthLoading ? false : true,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.username,
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
                            color: Theme.of(context).colorScheme.primary, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConst.lightGrey),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius15)),
                    hintText: 'Ex: abc123xyz',
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor)),
              ),

              const SizedBox(
                height: StyleConst.defaultPadding24,
              ),
              //password textField
              TextFormField(
                controller: widget.passwordTextEditingController,
                obscureText: !_passwordVisible,
                validator: (value) {
                  //Currently just stick with password length
                  // if (value != null && value.length < 7) {
                  //   return "Enter min. 7 characters";
                  // } else {
                  //   return null;
                  // }
                  return null; //Fix this later
                },
                enabled: state is AuthLoading ? false : true,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.focused)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).hintColor;
                      return bodyLarge(context)!
                          .copyWith(color: color, fontSize: 20);
                    }),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius15)),
                    suffixIcon: IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConst.lightGrey),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius15)),
                    hintText: "*********",
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor)),
              ),
            ],
          );
        });
  }
}
