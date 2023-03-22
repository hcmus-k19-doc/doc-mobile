import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/distrbution_org.dart';

class DropdownSearchOrg extends StatelessWidget {
  const DropdownSearchOrg(
      {Key? key,
      required this.listSuggestions,
      required this.onChanged,
      required this.title})
      : super(key: key);
  final List<DistributionOrg> listSuggestions;
  final void Function(DistributionOrg?) onChanged;
  final String title;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DistributionOrg>(
      onChanged: onChanged,
      clearButtonProps: const ClearButtonProps(
          icon: Icon(Icons.cancel_outlined),
          isVisible: true,
          splashColor: Colors.transparent),
      popupProps: const PopupProps.menu(
          fit: FlexFit.loose, showSearchBox: true, searchDelay: Duration.zero),
      itemAsString: (value) => value.name!,
      items: listSuggestions,
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: bodyLarge(context),
          dropdownSearchDecoration: InputDecoration(
              labelText: title,
              labelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.focused)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor;
                return bodyLarge(context)!.copyWith(color: color);
              }),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius:
                      BorderRadius.circular(StyleConst.defaultRadius15)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConst.lightGrey),
                  borderRadius:
                      BorderRadius.circular(StyleConst.defaultRadius15)),
              hintStyle:
                  const TextStyle(color: ColorConst.textFieldHintColor))),
    );
  }
}
