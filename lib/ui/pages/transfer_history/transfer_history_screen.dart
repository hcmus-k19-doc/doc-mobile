import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/history_tile.dart';

class TransferHistoryScreen extends StatefulWidget {
  const TransferHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransferHistoryScreen> createState() => _TransferHistoryScreenState();
}

class _TransferHistoryScreenState extends State<TransferHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(StyleConst.defaultPadding8),
        child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return const HistoryTile();
            }),
      ),
    );
  }
}
