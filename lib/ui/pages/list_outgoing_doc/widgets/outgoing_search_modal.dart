import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_outgoing_bloc/list_outgoing_bloc.dart';
import 'package:flutter_app/bloc/suggestion_bloc/suggestion_bloc.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/ui/common_widgets/dropdown_search_document.dart';
import 'package:flutter_app/ui/common_widgets/dropdown_search_org.dart';
import 'package:flutter_app/ui/common_widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class OutgoingSearchModal extends StatefulWidget {
  const OutgoingSearchModal({Key? key}) : super(key: key);

  @override
  State<OutgoingSearchModal> createState() => _OutgoingSearchModalState();
}

class _OutgoingSearchModalState extends State<OutgoingSearchModal> {
  final TextEditingController outgoingNumberController =
      TextEditingController();

  final TextEditingController documentTypeController = TextEditingController();

  DateTimeRange? releaseDateRange;
  final TextEditingController releaseDateRangeController =
      TextEditingController();

  final TextEditingController originalSymbolNumberController =
      TextEditingController();

  final TextEditingController summaryController = TextEditingController();

  late SuggestionBloc suggestionBloc;
  DocumentType? searchDocTypeVal;
  DistributionOrg? searchDisOrgVal;
  OutgoingSearchCriteria? outgoingSearchCriteria = OutgoingSearchCriteria();

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
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
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
                    title: AppLocalizations.of(context)!
                        .searchCriteriaBar("outgoing_number"),
                    textController: outgoingNumberController,
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  DropdownSearchDocument(
                    title: AppLocalizations.of(context)!
                        .searchCriteriaBar("document_type"),
                    onChanged: selectDocumentType,
                    listSuggestion:
                        state is SuggestionEmit ? state.documentTypes : [],
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  SearchTextField(
                    title: AppLocalizations.of(context)!
                        .searchCriteriaBar("release_date"),
                    readOnly: true,
                    trailingIcon: Icons.calendar_month,
                    textController: releaseDateRangeController,
                    onPressTrailingIcon: () => pickDateRage(
                        releaseDateRange, releaseDateRangeController),
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  SearchTextField(
                    title: AppLocalizations.of(context)!
                        .searchCriteriaBar("original_symbol_number"),
                    textController: originalSymbolNumberController,
                  ),
                  const SizedBox(
                    height: StyleConst.defaultPadding24,
                  ),
                  SearchTextField(
                    title: AppLocalizations.of(context)!
                        .searchCriteriaBar("summary"),
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(StyleConst.defaultRadius15),
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
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .searchCriteriaBar("search_summit"),
                            style: bodyLarge(context)
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            width: StyleConst.defaultPadding24 / 2,
                          ),
                          Icon(
                            Icons.search,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          )
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
    if (tempDocumentType?.id != -1) {
      searchDocTypeVal = tempDocumentType;
    }
  }

  void selectDistributionOrg(DistributionOrg? tempDistributionOrg) {
    if (tempDistributionOrg?.id != -1) {
      searchDisOrgVal = tempDistributionOrg;
    }
  }

  Future<void> pickDateRage(
      DateTimeRange? dateRange, TextEditingController dateController) async {
    dateRange = await showDateRangePicker(
        locale: const Locale('en', 'IN'),
        fieldStartHintText: "dd/MM/yyyy",
        fieldEndHintText: "dd/MM/yyyy",
        currentDate: DateTime.now(),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (dateRange == null) return;
    outgoingSearchCriteria?.releaseDateFrom =
        DateFormat('dd-MM-yyyy').format(dateRange.start);
    outgoingSearchCriteria?.releaseDateTo =
        DateFormat('dd-MM-yyyy').format(dateRange.end);
    setState(() {
      dateController.text =
          "${DateFormat('dd/MM/yyyy').format(dateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateRange!.end)} ";
    });
  }

  void startSearching() {
    outgoingSearchCriteria?.outgoingNumber =
        outgoingNumberController.text.trim();

    outgoingSearchCriteria?.originalSymbolNumber =
        originalSymbolNumberController.text.trim();

    outgoingSearchCriteria?.summary = summaryController.text.trim();

    outgoingSearchCriteria?.documentTypeId = searchDocTypeVal?.id;

    BlocProvider.of<ListOutgoingBloc>(context)
        .add(FilterOutgoingListDocumentEvent(outgoingSearchCriteria));
  }
}
