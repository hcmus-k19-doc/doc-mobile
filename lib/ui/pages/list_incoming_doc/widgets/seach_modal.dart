import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchModal extends StatefulWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
  SearchCriteria _searchCriteria = SearchCriteria();

  final TextEditingController incomingNumberController =
      TextEditingController();

  final TextEditingController documentTypeController = TextEditingController();

  DateTimeRange? arrivingDateRange;
  final TextEditingController arrivingDateRangeController =
      TextEditingController();

  final TextEditingController originalSymbolNumberController =
      TextEditingController();

  final TextEditingController distributionOrgController =
      TextEditingController();

  DateTimeRange? processingDateRange;
  final TextEditingController processingDateController =
      TextEditingController();

  final TextEditingController summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(StyleConst.defaultPadding),
        height: MediaQuery.of(context).size.height / 1.5,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchTextField(
                title: "Số đến theo sổ",
                textController: incomingNumberController,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Loại văn bản",
                textController: documentTypeController,
                trailingIcon: Icons.arrow_drop_down,
                onPressTrailingIcon: selectDocumentType,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Khoảng ngày đến",
                readOnly: true,
                trailingIcon: Icons.calendar_month,
                textController: arrivingDateRangeController,
                onPressTrailingIcon: () => pickDateRage(
                    arrivingDateRange, arrivingDateRangeController, true),
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Số ký hiệu gốc",
                textController: originalSymbolNumberController,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Cơ quan ban hành",
                textController: distributionOrgController,
                trailingIcon: Icons.arrow_drop_down,
                onPressTrailingIcon: selectDistributionOrg,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Thời hạn xử lý",
                readOnly: true,
                trailingIcon: Icons.calendar_month,
                textController: processingDateController,
                onPressTrailingIcon: () => pickDateRage(
                    processingDateRange, processingDateController, false),
              ),
              const SizedBox(
                height: StyleConst.defaultPadding,
              ),
              SearchTextField(
                title: "Trích yếu",
                textController: summaryController,
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
                    startSearching();
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

  void selectDistributionOrg() {
    print("Cơ quan ban hành");
  }

  Future<void> pickDateRage(DateTimeRange? dateRange,
      TextEditingController dateController, bool isArriving) async {
    dateRange = await showDateRangePicker(
        locale: Locale('en', 'IN'),
        fieldStartHintText: "dd/MM/yyyy",
        fieldEndHintText: "dd/MM/yyyy",
        currentDate: DateTime.now(),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (dateRange == null) return;
    if (isArriving) {
      _searchCriteria.arrivingDateFrom =
          DateFormat('dd-MM-yyyy').format(dateRange.start);
      _searchCriteria.arrivingDateTo =
          DateFormat('dd-MM-yyyy').format(dateRange.end);
    } else {
      _searchCriteria.processingDurationFrom =
          DateFormat('dd-MM-yyyy').format(dateRange.start);
      _searchCriteria.processingDurationTo =
          DateFormat('dd-MM-yyyy').format(dateRange.end);
    }
    setState(() {
      dateController.text =
          "${DateFormat('dd/MM/yyyy').format(dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateRange!.end)} ";
    });
  }

  void startSearching() {
    _searchCriteria.incomingNumber = incomingNumberController.text;

    _searchCriteria.documentType = documentTypeController.text;

    _searchCriteria.originalSymbolNumber = originalSymbolNumberController.text;

    _searchCriteria.distributionOrg = distributionOrgController.text;

    _searchCriteria.summary = summaryController.text;

    BlocProvider.of<ListIncomingBloc>(context)
        .add(FetchIncomingListDocumentEvent(searchCriteria: _searchCriteria));
  }
}
