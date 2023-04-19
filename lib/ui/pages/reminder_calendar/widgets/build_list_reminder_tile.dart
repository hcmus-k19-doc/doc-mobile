import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/reminder_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildListReminderTile extends StatefulWidget {
  const BuildListReminderTile({Key? key}) : super(key: key);

  @override
  State<BuildListReminderTile> createState() => _BuildListReminderTileState();
}

class _BuildListReminderTileState extends State<BuildListReminderTile> {
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
          if (state.mapReminder[documentReminderBloc.filterValue] != null) {
            return Column(
              children: [
                ...state.mapReminder[documentReminderBloc.filterValue]!
                    .map((e) {
                  return ReminderTile(reminder: e);
                }).toList()
              ],
            );
          }
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
