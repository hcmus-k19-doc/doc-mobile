import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/transfer_history.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/history_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key, required this.transferHistory})
      : super(key: key);
  final TransferHistory transferHistory;

  @override
  Widget build(BuildContext context) {
    int currentId = BlocProvider.of<AuthBloc>(context).profile!.id!;

    return InkWell(
      onTap: () {
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
                  backgroundColor: ColorConst.grey,
                  child: Icon(
                    currentId == transferHistory.senderId
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
                      AppLocalizations.of(context)!.transfer,
                      style: bodyLarge(context),
                    ),
                    const SizedBox(
                      height: StyleConst.defaultPadding4,
                    ),
                    Text(
                      "${currentId == transferHistory.senderId ? AppLocalizations.of(context)!.defaultSender : transferHistory.senderName} "
                      "${transferHistory.documentIds == null ? "" : AppLocalizations.of(context)!.sendDocumentIdsFor(transferHistory.documentIds!.join(", "))} "
                      " ${currentId != transferHistory.receiverId ? transferHistory.receiverName : AppLocalizations.of(context)!.defaultReciever}",
                      style:
                          bodyLarge(context)?.copyWith(color: ColorConst.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
