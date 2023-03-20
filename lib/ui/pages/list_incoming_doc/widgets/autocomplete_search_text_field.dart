import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/search_text_field.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteSearchTextField extends StatelessWidget {
  AutoCompleteSearchTextField({Key? key, required this.textEditingController})
      : super(key: key);

  TextEditingController textEditingController;

  final List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }

        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder: (context, fieldTextEditingController, fieldFocusNode,
          onFieldSubmitted) {
        textEditingController = fieldTextEditingController;
        return SearchTextField(
          title: "Loại văn bản",
          textController: textEditingController,
          focusNode: fieldFocusNode,
        );
      },
    );
  }
}
