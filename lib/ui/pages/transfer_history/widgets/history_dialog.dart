import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/transfer_history.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/text_row.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryDialog extends StatelessWidget {
  const HistoryDialog({Key? key, required this.transferHistory})
      : super(key: key);
  final TransferHistory transferHistory;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.defaultPadding12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.historyProcess,
              style: bodyLargeBold(context),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding16,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.sender,
              content: transferHistory.senderName ?? "",
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.reciever,
              content: transferHistory.receiverName ?? "",
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.document,
              content: transferHistory.documentIds == null
                  ? ""
                  : transferHistory.documentIds!.join(", "),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.transferDate,
              content: transferHistory.createdDate == null
                  ? ""
                  : DateFormat("dd-MM-yyyy")
                      .format(DateTime.parse(transferHistory.createdDate!)),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.processingTime,
              content: transferHistory.isInfiniteProcessingTime ?? true
                  ? AppLocalizations.of(context)!.infiniteProcessingTime
                  : DateFormat("dd-MM-yyyy").format(
                      DateTime.parse(transferHistory.processingDuration!)),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.transferType,
              content: transferHistory.isTransferToSameLevel ?? true
                  ? AppLocalizations.of(context)!.transferType2
                  : AppLocalizations.of(context)!.transferType1,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
            TextRow(
              title: AppLocalizations.of(context)!.processMethod,
              content: transferHistory.processMethod ??
                  AppLocalizations.of(context)!.noMethod,
            ),
            const SizedBox(
              height: StyleConst.defaultPadding8,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
