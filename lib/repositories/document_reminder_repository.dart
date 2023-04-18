import 'dart:collection';

import 'package:flutter_app/repositories/base_repository.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DocumentReminderRepository extends BaseRepository {
  DocumentReminderRepository(super.baseUrl);

  Future<LinkedHashMap<DateTime, List<String>>> getReminderBasedOnMonthYear(
      DateTime currentMonth) async {
    try {
      final response = await provider.get(
          url: "/${DateFormat("yyyy-MM").format(currentMonth)}");
      LinkedHashMap<DateTime, List<String>> tempReminder =
          LinkedHashMap<DateTime, List<String>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      response.forEach((key, value) {
        DateTime tempDate = DateFormat("yyyy-MM-dd").parse(key);
        if (tempReminder[tempDate] == null) {
          tempReminder[tempDate] = [];
        }
        tempReminder[tempDate]!.addAll(value.cast<String>()?.toList() ?? []);
      });
      return tempReminder;
    } catch (err) {
      rethrow;
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
