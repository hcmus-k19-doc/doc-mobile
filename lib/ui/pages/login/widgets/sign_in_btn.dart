import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBtn extends StatelessWidget {
  const SignInBtn(
      {Key? key,
      required this.formKey,
      required this.usernameTextEditingController,
      required this.passwordTextEditingController})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameTextEditingController,
      passwordTextEditingController;

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
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(StyleConst.defaultRadius))),
              onPressed: state is LoginLoading
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        _loginBloc.add(LoginEvent(
                            usernameTextEditingController.text,
                            passwordTextEditingController.text));
                      }
                    },
              child: Center(
                child: state is LoginLoading
                    ? const SizedBox(
                        height: StyleConst.defaultPadding,
                        width: StyleConst.defaultPadding,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : Text(
                        "Login",
                        style: FontConst.medium.copyWith(fontSize: 18),
                      ),
              )),
        );
      },
    );
  }
}
