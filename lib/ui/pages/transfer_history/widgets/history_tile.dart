import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/transfer_history_bloc/transfer_history_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/return_request.dart';
import 'package:flutter_app/model/transfer_history.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/history_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key, required this.transferHistory})
      : super(key: key);
  final TransferHistory transferHistory;

  String getTitle(
      ReturnRequest? returnRequest, BuildContext context, int currentId) {
    if (returnRequest == null) {
      return AppLocalizations.of(context)!.transfer;
    } else {
      String returnType = returnRequest.returnRequestType == "SEND_BACK"
          ? "Yêu cầu trả lại"
          : "Yêu cầu rút lại";
      return returnType;
    }
  }

  String getContent(
      ReturnRequest? returnRequest, BuildContext context, int currentId) {
    if (returnRequest == null) {
      return "${currentId == transferHistory.senderId ? AppLocalizations.of(context)!.defaultSender : transferHistory.senderName} "
          "${transferHistory.documentIds == null ? "" : AppLocalizations.of(context)!.sendDocumentIdsFor(transferHistory.documentIds!.join(", "))}"
          " ${currentId != transferHistory.receiverId ? transferHistory.receiverName : AppLocalizations.of(context)!.defaultReciever}";
    } else {
      String returnType = returnRequest.returnRequestType == "SEND_BACK"
          ? AppLocalizations.of(context)!
              .sendBackDocumentIdsFor(transferHistory.documentIds!.join(", "))
          : AppLocalizations.of(context)!
              .withdrawDocumentIdsFor(transferHistory.documentIds!.join(", "));
      return "${currentId == transferHistory.senderId ? AppLocalizations.of(context)!.defaultSender : transferHistory.senderName} "
          "${transferHistory.documentIds == null ? "" : returnType}";
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentId = BlocProvider.of<AuthBloc>(context).profile!.id!;

    return InkWell(
      onTap: () {
        BlocProvider.of<TransferHistoryBloc>(context).add(ReadAHistoryEvent(
            transferHistory.id!, transferHistory.isRead ?? true));
        showDialog(
            context: context,
            builder: (_) {
              return HistoryDialog(
                transferHistory: transferHistory,
              );
            });
      },
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: StyleConst.defaultPadding12,
              ),
              CircleAvatar(
                  backgroundColor: currentId == transferHistory.senderId &&
                          transferHistory.returnRequest == null
                      ? Colors.lightGreen
                      : Colors.lightBlue,
                  child: Icon(
                    currentId == transferHistory.senderId &&
                            transferHistory.returnRequest == null
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: ColorConst.white,
                  )),
              const SizedBox(
                width: StyleConst.defaultPadding12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      getTitle(
                          transferHistory.returnRequest, context, currentId),
                      style: bodyLarge(context),
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding4,
                    ),
                    Text(
                      getContent(
                          transferHistory.returnRequest, context, currentId),
                      style:
                          bodyLarge(context)?.copyWith(color: ColorConst.grey),
                    ),
                  ],
                ),
              ),
              if (transferHistory.isRead == false)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor),
                )
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
