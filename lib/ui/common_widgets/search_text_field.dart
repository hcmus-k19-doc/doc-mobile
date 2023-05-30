import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key,
      required this.title,
      this.trailingIcon,
      this.onPressTrailingIcon,
      this.maxLinesTextField,
      this.textController,
      this.readOnly})
      : super(key: key);
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onPressTrailingIcon;
  final int? maxLinesTextField;
  final TextEditingController? textController;
  final bool? readOnly;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: widget.readOnly ?? false,
        maxLines: widget.maxLinesTextField,
        controller: widget.textController,
        style: bodyLarge(context),
        decoration: InputDecoration(
            labelText: widget.title,
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.focused)
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor;
              return bodyLarge(context)!.copyWith(color: color);
            }),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: widget.trailingIcon != null
                ? IconButton(
                    icon: Icon(widget.trailingIcon),
                    onPressed: widget.onPressTrailingIcon,
                  )
                : null,
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
                borderRadius:
                    BorderRadius.circular(StyleConst.defaultRadius15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConst.lightGrey),
                borderRadius:
                    BorderRadius.circular(StyleConst.defaultRadius15)),
            hintStyle: const TextStyle(color: ColorConst.textFieldHintColor)));
  }
}
