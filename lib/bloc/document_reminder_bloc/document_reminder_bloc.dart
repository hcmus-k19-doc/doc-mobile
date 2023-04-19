import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/reminder_detail.dart';
import 'package:flutter_app/repositories/document_reminder_repository.dart';

part 'document_reminder_event.dart';

part 'document_reminder_state.dart';

class DocumentReminderBloc
    extends Bloc<DocumentReminderEvent, DocumentReminderState> {
  DocumentReminderRepository reminderRepository;
  LinkedHashMap<DateTime, List<String>> listReminders =
      LinkedHashMap<DateTime, List<String>>();
  String filterValue = "ACTIVE";

  DocumentReminderBloc(this.reminderRepository)
      : super(DocumentReminderInitial()) {
    on<FetchReminderMonth>((event, emit) async {
      if (state is! DocumentReminderMonthLoading) {
        emit(DocumentReminderMonthLoading());
        try {
          listReminders = await reminderRepository
              .getReminderBasedOnMonthYear(event.currentMonth);
          emit(const DocumentReminderMonthSuccess());
          if (DateUtils.isSameDay(DateTime.now(), event.currentMonth)) {
            add(FetchReminderDay(event.currentMonth));
          }
        } catch (error) {
          emit(DocumentReminderMonthError(error.toString()));
        }
      }
    });
    on<FetchReminderDay>((event, emit) async {
      if (listReminders[event.currentDay] != null) {
        if (state is! DocumentReminderDayLoading) {
          emit(DocumentReminderDayLoading());
          try {
            Map<String, List<ReminderDetail>> mapReminder =
                await reminderRepository
                    .getDocumentReminderDetailDay(event.currentDay);
            print(mapReminder["ACTIVE"]);
            emit(DocumentReminderDaySuccess(mapReminder, filterValue));
          } catch (error) {
            emit(DocumentReminderDayError(error.toString()));
          }
        }
      } else {
        emit(DocumentReminderDayLoading());
        emit(DocumentReminderDaySuccess(const {}, filterValue));
      }
    });
    on<FilterReminderEvent>((event, emit) {
      filterValue = event.filterValue;
      if (state is DocumentReminderDaySuccess) {
        final tempState = state as DocumentReminderDaySuccess;
        emit(DocumentReminderDaySuccess(tempState.mapReminder, filterValue));
      } else {
        emit(DocumentReminderDayLoading());
        emit(DocumentReminderDaySuccess(const {}, filterValue));
      }
    });
  }
}
