import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget(
      {Key? key,
      required this.title,
      required this.initialText,
      required this.isTextFieldEnable})
      : super(key: key);
  final String title;
  final String initialText;
  final bool isTextFieldEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: bodyLargeBold(context)!
              .copyWith(color: Theme.of(context).primaryColor, fontSize: 16),
        ),
        TextFormField(
          enabled: isTextFieldEnable,
          autovalidateMode: AutovalidateMode.always,
          controller: TextEditingController()..text = initialText,
          validator: (value) {
            if (isTextFieldEnable) {
              return value!.isEmpty ? "Require value" : null;
            }
          },
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(
                  top: StyleConst.defaultPadding4,
                  bottom: StyleConst.defaultPadding8)),
          style: bodyLargeBold(context)!.copyWith(fontSize: 16),
        )
      ],
    );
  }
}
