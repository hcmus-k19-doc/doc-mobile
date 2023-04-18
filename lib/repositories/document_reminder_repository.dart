import 'dart:collection';

import 'package:flutter_app/model/incoming_document.dart';
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

  Future<Map<String, List<IncomingDocument>>> getDocumentReminderDetailDay(
      DateTime day) async {
    try {
      var response = await provider.get(
          url: "/details/${DateFormat("yyyy-MM-dd").format(day)}");
      Map<String, List<IncomingDocument>> mapReminders = {};
      response.forEach((key, value) {
        Iterable l = value;
        List<IncomingDocument> tempListReminder = List<IncomingDocument>.from(
            l.map((e) => IncomingDocument.fromJson(e))).toList();
        mapReminders[key] = tempListReminder;
      });
      return mapReminders;
    } catch (error) {
      rethrow;
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
