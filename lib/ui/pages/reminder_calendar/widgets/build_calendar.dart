import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
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
  List<Event> _selectedEvents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstDay = DateTime(2000);
    _lastDay = DateTime(2100);
    _today = DateTime.now();
    initEvent();
    _selectedEvents = events[_today] ?? [];
  }

  void initEvent() {
    events = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll({
        for (var item in List.generate(50, (index) => index))
          DateTime.utc(_today.year, _today.month, item * 5): List.generate(
              item % 4 + 1, (index) => Event('Event $item | ${index + 1}'))
      });
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _today,
          firstDay: _firstDay,
          lastDay: _lastDay,
          calendarFormat: CalendarFormat.month,
          selectedDayPredicate: (day) => isSameDay(_today, day),
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _today = selectedDay;
              _selectedEvents = events[_today] ?? [];
            });
          },
          calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.65),
                  shape: BoxShape.circle)),
          eventLoader: (day) {
            return events[day] ?? [];
          },
          calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday) {
              final text = DateFormat.E().format(day);

              return Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
          }, markerBuilder: (context, day, eventDay) {
            if (eventDay.isNotEmpty) {
              return Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    backgroundColor: Colors.red[400],
                    radius: 10,
                    child: Text(
                      eventDay.length.toString(),
                      style: bodyLarge(context)!
                          .copyWith(height: 0, color: Colors.white),
                    )),
              );
            }
          }),
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
  }
}
