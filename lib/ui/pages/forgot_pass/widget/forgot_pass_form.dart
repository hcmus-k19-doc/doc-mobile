import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/utils/validation_extension.dart';

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
            if (value != null && !value.isValidEmail) {
              return 'Email must follow standard format';
            } else {
              return null;
            }
          },
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
              hintText: 'Ex: abc@gmail.com',
              hintStyle: const TextStyle(color: ColorConst.textFieldHintColor)),
        ),
        const SizedBox(
          height: StyleConst.defaultPadding,
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
                          BorderRadius.circular(StyleConst.defaultRadius))),
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  print("send link reset pass");
                  Navigator.pushReplacementNamed(context, MyRouter.checkYourMail);
                }
              },
              child: Center(
                child: Text(
                  "Send Instructions",
                  style: FontConst.medium.copyWith(fontSize: 18),
                ),
              )),
        )
      ],
    );
  }
}
