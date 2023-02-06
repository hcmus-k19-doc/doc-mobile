import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

Widget SigninBtn(GlobalKey<FormState> formKey, LoginBloc loginBloc,
    BuildContext context, Object state) {
  return Padding(
    padding:
        const EdgeInsets.symmetric(horizontal: StyleConst.defaultPadding * 3),
    child: ElevatedButton(
        onPressed: formKey.currentState == null ||
                !formKey.currentState!.validate()
            ? null
            : () {
                //API test
                loginBloc.add(const LoginEvent("https://fakestoreapi.com/"));
              },
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(StyleConst.defaultRadius)),
            padding: const EdgeInsets.all(12)),
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
                  "Sign in",
                  style: FontConst.SEMIBOLD_WHITE_18,
                ),
        )),
  );
}
