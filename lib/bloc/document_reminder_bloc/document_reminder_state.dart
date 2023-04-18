part of 'document_reminder_bloc.dart';

abstract class DocumentReminderState extends Equatable {
  const DocumentReminderState();
  @override
  List<Object> get props => [];
}

class DocumentReminderInitial extends DocumentReminderState {}

class DocumentReminderMonthLoading extends DocumentReminderState {}

class DocumentReminderMonthSuccess extends DocumentReminderState {
  final LinkedHashMap<DateTime, List<String>> reminders;

  const DocumentReminderMonthSuccess(this.reminders);
}

class DocumentReminderMonthError extends DocumentReminderState {
  final String message;

  const DocumentReminderMonthError(this.message);
}
