import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
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
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
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
              onPressed: state is AuthLoading
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        authBloc.add(LoginEvent(
                            usernameTextEditingController.text,
                            passwordTextEditingController.text));
                      }
                    },
              child: Center(
                child: state is AuthLoading
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
