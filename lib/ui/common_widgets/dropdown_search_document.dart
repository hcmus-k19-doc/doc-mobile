import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/document_type.dart';

class DropdownSearchDocument extends StatelessWidget {
  DropdownSearchDocument(
      {Key? key,
      required this.listSuggestion,
      required this.onChanged,
      required this.title})
      : super(key: key);

  final List<DocumentType> listSuggestion;
  final void Function(DocumentType?) onChanged;
  final String title;
  DocumentType? selectedDoc;
  GlobalKey<DropdownSearchState<DocumentType>> dropdownKey =
      GlobalKey<DropdownSearchState<DocumentType>>();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DocumentType>(
      key: dropdownKey,
      onChanged: (value) {
        if (value?.id == -1) {
          selectedDoc = null;
          dropdownKey.currentState?.clear();
        } else {
          selectedDoc = value;
        }
        onChanged(selectedDoc);
      },
      selectedItem: selectedDoc,
      popupProps: const PopupProps.menu(
          fit: FlexFit.loose, showSearchBox: true, searchDelay: Duration.zero),
      itemAsString: (value) => value.type!,
      items: listSuggestion,
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: bodyLarge(context),
          dropdownSearchDecoration: InputDecoration(
              labelText: title,
              labelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.focused)
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).hintColor;
                return bodyLarge(context)!.copyWith(color: color);
              }),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
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
