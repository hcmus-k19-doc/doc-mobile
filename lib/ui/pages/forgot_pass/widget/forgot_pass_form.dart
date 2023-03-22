import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            // if (value != null && !value.isValidEmail) {
            //   return 'Email must follow standard format';
            // } else {
            //   return null;
            // }
            return null;
          },
          decoration: InputDecoration(
              labelText: "Email",
              labelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.focused)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor;
                return bodyLarge(context)!.copyWith(color: color, fontSize: 20);
              }),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius:
                      BorderRadius.circular(StyleConst.defaultRadius15)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConst.lightGrey),
                  borderRadius:
                      BorderRadius.circular(StyleConst.defaultRadius15)),
              hintText: 'Ex: abc@gmail.com',
              hintStyle: const TextStyle(color: ColorConst.textFieldHintColor)),
        ),
        const SizedBox(
          height: StyleConst.defaultPadding24,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  elevation: 2,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(StyleConst.defaultRadius15))),
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  print("send link reset pass");
                  Navigator.pushReplacementNamed(
                      context, MyRouter.checkYourMail);
                }
              },
              child: Center(
                child: Text(
                  "Send Instructions",
                  style: bodyLargeBold(context)
                      ?.copyWith(fontSize: 18, color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}
