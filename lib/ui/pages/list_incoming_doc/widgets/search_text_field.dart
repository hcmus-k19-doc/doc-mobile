import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key,
      required this.title,
      this.trailingIcon,
      this.onPressTrailingIcon,
      this.maxLinesTextField})
      : super(key: key);
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onPressTrailingIcon;
  final int? maxLinesTextField;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(widget.title)),
        Expanded(
            flex: 3,
            child: TextField(
                maxLines: widget.maxLinesTextField,
                decoration: InputDecoration(
                    suffixIcon: widget.trailingIcon != null
                        ? IconButton(
                            icon: Icon(widget.trailingIcon),
                            onPressed: widget.onPressTrailingIcon,
                          )
                        : null,
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConst.lightGrey),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius)),
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor))))
      ],
    );
  }
}
