import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField(
      {Key? key,
      required this.title,
      this.validator,
      required this.textController})
      : super(key: key);
  final String title;
  final TextEditingController textController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: bodyLargeBold(context)!
              .copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 16),
        ),
        TextFormField(
          controller: textController,
          validator: validator,
          obscureText: true,
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
