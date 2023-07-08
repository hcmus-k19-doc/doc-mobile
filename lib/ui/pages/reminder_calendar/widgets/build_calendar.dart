import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/constants/themes.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/filter_reminder.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/reminder_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BuildCalendar extends StatefulWidget {
  const BuildCalendar({Key? key}) : super(key: key);

  @override
  State<BuildCalendar> createState() => _BuildCalendarState();
}

class _BuildCalendarState extends State<BuildCalendar> {
  late DateTime _firstDay, _lastDay, _today;
  late DocumentReminderBloc documentReminderBloc;

  // List<Event> _selectedEvents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstDay = DateTime(2000);
    _lastDay = DateTime(2100);
    _today = DateTime.now();
    documentReminderBloc = BlocProvider.of<DocumentReminderBloc>(context)
      ..add(FetchReminderMonth(_today));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentReminderBloc, DocumentReminderState>(
      listener: (context, state) {
        if (state is DocumentReminderMonthSuccess) {}
      },
      builder: (context, state) {
        return Stack(
          children: [
            TableCalendar(
              focusedDay: _today,
              locale: Provider.of<SettingsProvider>(context).localeString,
              firstDay: _firstDay,
              lastDay: _lastDay,
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) => isSameDay(_today, day),
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              onDaySelected: (selectedDay, focusedDay) {
                _today = selectedDay;
                documentReminderBloc.add(FetchReminderDay(_today));
              },
              calendarStyle: CalendarStyle(
                  selectedTextStyle: const TextStyle(color: Colors.black),
                  selectedDecoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle),
                  todayTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  todayDecoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.15),
                      shape: BoxShape.circle)),
              eventLoader: (day) {
                if (documentReminderBloc.listReminders.isNotEmpty) {
                  return documentReminderBloc.listReminders[day] ?? [];
                } else {
                  return [];
                }
              },
              calendarBuilders: CalendarBuilders(
                  outsideBuilder: (context, outsideDate, focusDate) {
                if (!outsideDate.month.isEqual(focusDate.month)) {
                  return const SizedBox();
                }
                return null;
              }, dowBuilder: (context, day) {
                if (day.weekday == DateTime.sunday) {
                  final text = DateFormat.E().format(day);

                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return null;
              }, singleMarkerBuilder: (context, day, eventDay) {
                Color colorMarker = Colors.black;
                switch (eventDay) {
                  case "ACTIVE":
                    colorMarker = Colors.green;
                    break;
                  case "CLOSE_TO_EXPIRATION":
                    colorMarker = Colors.orange;
                    break;
                  case "EXPIRED":
                    colorMarker = Colors.red;
                    break;
                  default:
                    break;
                }
                return Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: colorMarker),
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                );
              }),
              onPageChanged: (focusedDay) {
                _today = focusedDay;
                documentReminderBloc.add(FetchReminderMonth(_today));
              },
            ),
            if (state is DocumentReminderMonthLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
