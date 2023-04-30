part of 'document_reminder_bloc.dart';

abstract class DocumentReminderState extends Equatable {
  const DocumentReminderState();

  @override
  List<Object> get props => [];
}

class DocumentReminderInitial extends DocumentReminderState {}

class DocumentReminderMonthLoading extends DocumentReminderState {}

class DocumentReminderMonthSuccess extends DocumentReminderState {
  const DocumentReminderMonthSuccess();
}

class DocumentReminderMonthError extends DocumentReminderState {
  final String message;

  const DocumentReminderMonthError(this.message);
}

class DocumentReminderDayLoading extends DocumentReminderState {}

class DocumentReminderDaySuccess extends DocumentReminderState {
  final Map<String, List<ReminderDetail>> mapReminder;
  final String filterValue;

  const DocumentReminderDaySuccess(this.mapReminder, this.filterValue);
  @override
  List<Object> get props => [filterValue];
}

class DocumentReminderDayError extends DocumentReminderState {
  final String message;

  const DocumentReminderDayError(this.message);
}
