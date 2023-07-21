import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/transfer_history_bloc/transfer_history_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/build_list_transfer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferHistoryScreen extends StatefulWidget {
  const TransferHistoryScreen({Key? key, required this.transferHistoryBloc})
      : super(key: key);

  final TransferHistoryBloc transferHistoryBloc;

  @override
  State<TransferHistoryScreen> createState() => _TransferHistoryScreenState();
}

class _TransferHistoryScreenState extends State<TransferHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.transferHistoryBloc
        ..add(FetchTransferHistoryEvent(
            BlocProvider.of<AuthBloc>(context).profile!.id!)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.notification),
        ),
        body: Container(
          padding: const EdgeInsets.all(StyleConst.defaultPadding8),
          child: const BuildListTransfer(),
        ),
      ),
    );
  }
}
