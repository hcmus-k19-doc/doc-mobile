import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
//testing

class BuildCalendar extends StatefulWidget {
  const BuildCalendar({Key? key}) : super(key: key);

  @override
  State<BuildCalendar> createState() => _BuildCalendarState();
}

class _BuildCalendarState extends State<BuildCalendar> {
  late DateTime _firstDay, _lastDay, _today;
  late LinkedHashMap<DateTime, List<Event>> events;
  late DocumentReminderBloc documentReminderBloc;
  List<Event> _selectedEvents = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstDay = DateTime(2000);
    _lastDay = DateTime(2100);
    _today = DateTime.now();
    documentReminderBloc = BlocProvider.of<DocumentReminderBloc>(context)
      ..add(FetchReminderMonth(_today));
    initEvent();
    _selectedEvents = events[_today] ?? [];
  }

  void initEvent() {
    events = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    final firstDayMonth = DateTime(_today.year, _today.month, 1);
    final lastDayMonth = DateTime(_today.year, _today.month + 1, 0);
    for (int i = 1; i <= lastDayMonth.day; i++) {
      if (i * 5 > lastDayMonth.day) {
        break;
      }
      final day = DateTime.utc(firstDayMonth.year, firstDayMonth.month, i * 5);
      if (events[day] == null) {
        events[day] = [];
      }
      final List<Event> tempListEvent =
          List.generate(i % 4 + 1, (index) => Event('Event $i | ${index + 1}'));
      events[day]!.addAll(tempListEvent);
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void fetchNewEvent() async {
    setState(() {
      events.clear();
      _selectedEvents.clear();
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    final firstDayMonth = DateTime(_today.year, _today.month, 1);
    final lastDayMonth = DateTime(_today.year, _today.month + 1, 0);
    for (int i = 1; i <= lastDayMonth.day; i++) {
      if (i * 5 > lastDayMonth.day) {
        break;
      }
      final day = DateTime.utc(firstDayMonth.year, firstDayMonth.month, i * 5);
      if (events[day] == null) {
        events[day] = [];
      }
      final List<Event> tempListEvent =
          List.generate(i % 4 + 1, (index) => Event('Event $i | ${index + 1}'));
      events[day]!.addAll(tempListEvent);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentReminderBloc, DocumentReminderState>(
      builder: (context, state) {
        return Column(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                return Stack(
                  children: [
                    TableCalendar(
                      focusedDay: _today,
                      firstDay: _firstDay,
                      lastDay: _lastDay,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) => isSameDay(_today, day),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _today = selectedDay;
                          _selectedEvents = events[_today] ?? [];
                        });
                      },
                      calendarStyle: CalendarStyle(
                          selectedTextStyle:
                              const TextStyle(color: Colors.black),
                          selectedDecoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              shape: BoxShape.circle),
                          todayTextStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          todayDecoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.15),
                              shape: BoxShape.circle)),
                      eventLoader: (day) {
                        if (state is DocumentReminderMonthSuccess) {
                          return state.reminders[day] ?? [];
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
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: colorMarker),
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 1.5),
                        );
                      }),
                      onPageChanged: (focusedDay) {
                        setState(() {
                          _today = focusedDay;
                        });
                        fetchNewEvent();
                      },
                    ),
                    if (state is DocumentReminderMonthLoading)
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width: constraint.maxHeight,
                        height: constraint.maxWidth,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: StyleConst.defaultPadding8),
            Column(
              children: [
                ..._selectedEvents.map((e) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print(e.title),
                        title: Text(e.title),
                      ),
                    ))
              ],
            )
          ],
        );
      },
    );
  }
}
