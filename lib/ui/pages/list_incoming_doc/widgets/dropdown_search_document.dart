import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/document_type.dart';

class DropdownSearchDocument extends StatelessWidget {
  DropdownSearchDocument(
      {Key? key, required this.listSuggestion, required this.onChanged})
      : super(key: key);

  final List<DocumentType> listSuggestion;
  final void Function(DocumentType?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1, child: Text("Loại văn bản", style: bodyLarge(context))),
        Expanded(
          flex: 3,
          child: DropdownSearch<DocumentType>(
            onChanged: onChanged,
            clearButtonProps: const ClearButtonProps(
                icon: Icon(Icons.cancel_outlined),
                isVisible: true,
                splashColor: Colors.transparent),
            popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
                showSearchBox: true,
                searchDelay: Duration.zero),
            itemAsString: (value) => value.type!,
            items: listSuggestion,
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
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
                        const TextStyle(color: ColorConst.textFieldHintColor))),
          ),
        ),
      ],
    );
  }
}
