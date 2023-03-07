import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class SignInBtn extends StatelessWidget {
  const SignInBtn({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(StyleConst.defaultRadius))),
        onPressed: () {
          if (formKey.currentState!.validate())
            {
              print("Valid login");
            }
        },
        child: Text(
          "Login",
          style: FontConst.medium.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
