import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/reminder_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({Key? key, required this.reminder}) : super(key: key);
  final ReminderDetail reminder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: StyleConst.defaultPadding8,
      ),
      padding: const EdgeInsets.all(StyleConst.defaultPadding12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(reminder.incomingNumber ?? ""),
              Text(reminder.summary ?? ""),
            ],
          ),
          Text(reminder.expirationDate ?? "")
        ],
      ),
    );
  }
}
