import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/reminder_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({Key? key, required this.reminder}) : super(key: key);
  final ReminderDetail reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (reminder.documentType == "OUTGOING_DOCUMENT") {
          Navigator.of(context).pushNamed(MyRouter.outgoingDocumentDetail,
              arguments:
                  DocumentDetailArgs(documentId: reminder.documentId ?? -1));
        } else if (reminder.documentType == "INCOMING_DOCUMENT") {
          Navigator.of(context).pushNamed(MyRouter.incomingDocumentDetail,
              arguments:
                  DocumentDetailArgs(documentId: reminder.documentId ?? -1));
        }
      },
      child: Card(
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(StyleConst.defaultRadius15)),
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: StyleConst.defaultPadding8,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: StyleConst.defaultPadding16,
              vertical: StyleConst.defaultPadding12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${AppLocalizations.of(context)!.documentTypeReminder(reminder.documentType ?? "")}: ",
                          style: bodyLargeBold(context),
                        ),
                        Expanded(
                          child: Text(
                            reminder.documentName ?? "",
                            style: bodyLargeBold(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding4,
                    ),
                    HtmlWidget(
                      reminder.summary ?? "",
                      textStyle:
                          bodyLarge(context)?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(reminder.expirationDate ?? "",
                  style: bodyLarge(context)?.copyWith(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
