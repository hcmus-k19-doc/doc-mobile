import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/build_calendar.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/build_list_reminder_tile.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/widgets/filter_reminder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReminderCalendarScreen extends StatelessWidget {
  const ReminderCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: StyleConst.defaultPadding12),
        child: Column(
          children: const [
            FilterReminder(),
            BuildCalendar(),
            SizedBox(height: StyleConst.defaultPadding8),
            Padding(
              padding: EdgeInsets.all(StyleConst.defaultPadding12),
              child: BuildListReminderTile(),
            )
          ],
        ),
      ),
    );
  }
}
