import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterReminder extends StatefulWidget {
  const FilterReminder({Key? key}) : super(key: key);

  @override
  State<FilterReminder> createState() => _FilterReminderState();
}

class _FilterReminderState extends State<FilterReminder> {
  // late AppLocalizations appLocalizations;
  List<String> list = <String>[
    "ACTIVE",
    "CLOSE_TO_EXPIRATION",
    "EXPIRED",
  ];
  late String dropdownValue;
  late DocumentReminderBloc documentReminderBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentReminderBloc = BlocProvider.of<DocumentReminderBloc>(context);
    dropdownValue = documentReminderBloc.filterValue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentReminderBloc, DocumentReminderState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: StyleConst.defaultPadding12),
          child: Row(
            children: [
              Text(
                "${AppLocalizations.of(context)!.filterBy}: ",
                style: bodyLarge(context)!.copyWith(fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: StyleConst.defaultPadding8,
                    top: StyleConst.defaultPadding8,
                    bottom: StyleConst.defaultPadding8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(StyleConst.defaultRadius15),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton(
                    isDense: true,
                    value: dropdownValue,
                    underline: const SizedBox(),
                    items: list
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(AppLocalizations.of(context)!
                                .documentReminderStatus(e))))
                        .toList(),
                    onChanged: (String? newValue) {
                      dropdownValue = newValue!;
                      documentReminderBloc
                          .add(FilterReminderEvent(dropdownValue));
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
