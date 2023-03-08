import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/constants/url_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBtn extends StatelessWidget {
  const SignInBtn({Key? key, required this.formKey, required this.emailTextEditingController, required this.passwordTextEditingController}) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailTextEditingController, passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        StyleConst.defaultRadius))),
            onPressed: () {
              _loginBloc.add(LoginEvent(emailTextEditingController.text
                  , passwordTextEditingController.text));
              // if (formKey.currentState!.validate()) {
              // }
            },
            child: Text(
              "Login",
              style: FontConst.medium.copyWith(fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
