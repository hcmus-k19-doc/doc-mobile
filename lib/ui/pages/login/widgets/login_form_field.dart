import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConst.lightGrey),
                    borderRadius:
                        BorderRadius.circular(StyleConst.defaultRadius)),
                hintText: "Email",
                hintStyle: TextStyle(color: ColorConst.textFieldHintColor)),
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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConst.lightGrey),
                    borderRadius:
                        BorderRadius.circular(StyleConst.defaultRadius)),
                hintText: "Password",
                hintStyle: TextStyle(color: ColorConst.textFieldHintColor)),
          ),
        ),
      ],
    );
  }
}
