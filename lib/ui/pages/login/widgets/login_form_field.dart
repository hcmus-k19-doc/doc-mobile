import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({Key? key}) : super(key: key);

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder(
        bloc: _loginBloc,
        builder: (context, state) {
          return Column(
            children: [
              //username or email textField
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: StyleConst.defaultPadding),
                child: TextFormField(
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return "Enter min. 7 characters";
                    } else {
                      return null;
                    }
                  },
                  enabled: state is LoginLoading ? false : true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.lightGrey),
                          borderRadius:
                              BorderRadius.circular(StyleConst.defaultRadius)),
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: ColorConst.textFieldHintColor)),
                ),
              ),

              const SizedBox(
                height: StyleConst.defaultPadding,
              ),

              //password textField
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: StyleConst.defaultPadding),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return "Enter min. 7 characters";
                    } else {
                      return null;
                    }
                  },
                  enabled: state is LoginLoading ? false : true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.lightGrey),
                          borderRadius:
                              BorderRadius.circular(StyleConst.defaultRadius)),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: ColorConst.textFieldHintColor)),
                ),
              ),
            ],
          );
        });
  }
}
