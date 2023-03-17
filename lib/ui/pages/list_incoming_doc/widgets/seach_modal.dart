import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/search_text_field.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(StyleConst.defaultPadding),
        height: MediaQuery.of(context).size.height / 2,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchTextField(title: "Số đến theo sổ"),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Loại văn bản",
                trailingIcon: Icons.arrow_drop_down,
                onPressTrailingIcon: selectDocumentType,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Khoảng ngày đến",
                trailingIcon: Icons.calendar_month,
                onPressTrailingIcon: selectIncomingDate,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(title: "Số ký hiệu gốc"),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Cơ quan ban hành",
                trailingIcon: Icons.arrow_drop_down,
                onPressTrailingIcon: selectAgentIssued,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Thời hạn xử lý",
                trailingIcon: Icons.calendar_month,
                onPressTrailingIcon: selectHandleDate,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Trích yếu",
                maxLinesTextField: 3,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          StyleConst.defaultRadius), // <-- Radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: StyleConst.defaultPadding / 2), // and this
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Tìm kiếm"),
                      SizedBox(
                        width: StyleConst.defaultPadding / 2,
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectDocumentType() {
    print("loại văn bản");
  }

  void selectIncomingDate() {
    print("Khoảng ngày đến");
  }

  void selectAgentIssued() {
    print("Cơ quan ban hành");
  }

  void selectHandleDate() {
    print("Thời hạn xử lý");
  }
}
