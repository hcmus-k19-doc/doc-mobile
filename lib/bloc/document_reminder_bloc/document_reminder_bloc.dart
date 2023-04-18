import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/repositories/document_reminder_repository.dart';
import 'package:table_calendar/table_calendar.dart';

part 'document_reminder_event.dart';

part 'document_reminder_state.dart';

class DocumentReminderBloc
    extends Bloc<DocumentReminderEvent, DocumentReminderState> {
  DocumentReminderRepository reminderRepository;

  DocumentReminderBloc(this.reminderRepository)
      : super(DocumentReminderInitial()) {
    on<FetchReminderMonth>((event, emit) async {
      if (state is! DocumentReminderMonthLoading) {
        emit(DocumentReminderMonthLoading());
        try {
          LinkedHashMap<DateTime, List<String>> reminders =
              await reminderRepository
                  .getReminderBasedOnMonthYear(event.currentMonth);
          emit(DocumentReminderMonthSuccess(reminders));
        } catch (error) {
          print(error);
          emit(DocumentReminderMonthError(error.toString()));
        }
      }
    });
  }
}
