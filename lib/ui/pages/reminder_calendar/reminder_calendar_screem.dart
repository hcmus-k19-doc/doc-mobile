import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/build_calendar.dart';

class ReminderCalendarScreen extends StatelessWidget {
  const ReminderCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [BuildCalendar()],
      ),
    );
  }
}
