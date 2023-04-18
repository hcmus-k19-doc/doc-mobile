import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderTile extends StatefulWidget {
  const ReminderTile({Key? key}) : super(key: key);

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  late DocumentReminderBloc documentReminderBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentReminderBloc = BlocProvider.of<DocumentReminderBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentReminderBloc, DocumentReminderState>(
      builder: (context, state) {
        if (state is DocumentReminderDayLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DocumentReminderDaySuccess) {
          return Column(
            children: [
              ...state.mapReminder.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key),
                    ...entry.value.map((e) => Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: StyleConst.defaultPadding8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => print(e.incomingNumber),
                            title: Text(e.incomingNumber ?? ""),
                          ),
                        ))
                  ],
                );
              })
            ],
          );
        }
        if (state is DocumentReminderMonthError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.red),
          );
        }
        return const SizedBox();
      },
    );
  }
}
