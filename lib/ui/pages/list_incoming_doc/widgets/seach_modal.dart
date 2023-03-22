import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/bloc/suggestion_bloc/suggestion_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/dropdown_search_document.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/dropdown_search_org.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchModal extends StatefulWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
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

  late SuggestionBloc suggestionBloc;
  DocumentType? searchDocTypeVal;
  DistributionOrg? searchDisOrgVal;
  SearchCriteria? searchCriteria = SearchCriteria();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestionBloc = BlocProvider.of<SuggestionBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      bloc: suggestionBloc,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.all(StyleConst.defaultPadding24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.only(
                              bottom: StyleConst.defaultPadding24 / 2),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.clear))
                    ],
                  ),
                  SearchTextField(
                    title: "Số đến theo sổ",
                    textController: incomingNumberController,
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  DropdownSearchDocument(
                    onChanged: selectDocumentType,
                    listSuggestion:
                        state is SuggestionEmit ? state.documentTypes : [],
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
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
                    height: StyleConst.defaultPadding24,
                  ),
                  SearchTextField(
                    title: "Số ký hiệu gốc",
                    textController: originalSymbolNumberController,
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  DropdownSearchOrg(
                    onChanged: selectDistributionOrg,
                    listSuggestions:
                        state is SuggestionEmit ? state.distributionOrgs : [],
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
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
                    height: StyleConst.defaultPadding24,
                  ),
                  SearchTextField(
                    title: "Trích yếu",
                    textController: summaryController,
                    maxLinesTextField: 3,
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              StyleConst.defaultRadius25), // <-- Radius
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                StyleConst.defaultPadding24 / 2), // and this
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
                            width: StyleConst.defaultPadding24 / 2,
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
      },
    );
  }

  void selectDocumentType(DocumentType? tempDocumentType) {
    searchDocTypeVal = tempDocumentType;
  }

  void selectDistributionOrg(DistributionOrg? tempDistributionOrg) {
    searchDisOrgVal = tempDistributionOrg;
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
      searchCriteria?.arrivingDateFrom =
          DateFormat('dd-MM-yyyy').format(dateRange.start);
      searchCriteria?.arrivingDateTo =
          DateFormat('dd-MM-yyyy').format(dateRange.end);
    } else {
      searchCriteria?.processingDurationFrom =
          DateFormat('dd-MM-yyyy').format(dateRange.start);
      searchCriteria?.processingDurationTo =
          DateFormat('dd-MM-yyyy').format(dateRange.end);
    }
    setState(() {
      dateController.text =
          "${DateFormat('dd/MM/yyyy').format(dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateRange!.end)} ";
    });
  }

  void startSearching() {
    searchCriteria?.incomingNumber = incomingNumberController.text;

    searchCriteria?.originalSymbolNumber = originalSymbolNumberController.text;

    searchCriteria?.summary = summaryController.text;

    searchCriteria?.documentTypeId = searchDocTypeVal?.id;

    searchCriteria?.distributionOrgId = searchDisOrgVal?.id;

    BlocProvider.of<ListIncomingBloc>(context)
        .add(FilterIncomingListDocumentEvent(searchCriteria));
  }
}
