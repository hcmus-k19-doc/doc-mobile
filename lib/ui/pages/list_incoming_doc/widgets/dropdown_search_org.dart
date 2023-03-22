import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/distrbution_org.dart';

class DropdownSearchOrg extends StatelessWidget {
  const DropdownSearchOrg(
      {Key? key, required this.listSuggestions, required this.onChanged})
      : super(key: key);
  final List<DistributionOrg> listSuggestions;
  final void Function(DistributionOrg?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text("Cơ quan ban hành", style: bodyLarge(context))),
        Expanded(
          flex: 3,
          child: DropdownSearch<DistributionOrg>(
            onChanged: onChanged,
            clearButtonProps: const ClearButtonProps(
                icon: Icon(Icons.cancel_outlined),
                isVisible: true,
                splashColor: Colors.transparent),
            popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
                showSearchBox: true,
                searchDelay: Duration.zero),
            itemAsString: (value) => value.name!,
            items: listSuggestions,
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius25)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConst.lightGrey),
                        borderRadius:
                            BorderRadius.circular(StyleConst.defaultRadius25)),
                    hintStyle:
                        const TextStyle(color: ColorConst.textFieldHintColor))),
          ),
        ),
      ],
    );
  }
}
