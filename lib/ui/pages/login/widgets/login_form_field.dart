import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder(
        bloc: _loginBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //username or email textField

              Padding(
                padding: const EdgeInsets.only(
                    bottom: StyleConst.defaultPadding / 2),
                child: Text(
                  "Username",
                  style: FontConst.SEMIBOLD_BLACK_18,
                ),
              ),

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
                enabled: state is LoginLoading ? false : true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConst.lightGrey),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    hintText: 'Ex: abc123xyz',
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor)),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    bottom: StyleConst.defaultPadding / 2,
                    top: StyleConst.defaultPadding),
                child: Text(
                  "Password",
                  style: FontConst.SEMIBOLD_BLACK_18,
                ),
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
                enabled: state is LoginLoading ? false : true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
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
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    hintText: "*********",
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor)),
              ),
            ],
          );
        });
  }
}
