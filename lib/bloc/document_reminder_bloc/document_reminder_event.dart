part of 'document_reminder_bloc.dart';

abstract class DocumentReminderEvent extends Equatable {
  const DocumentReminderEvent();
}

class FetchReminderMonth extends DocumentReminderEvent {
  final DateTime currentMonth;

  const FetchReminderMonth(this.currentMonth);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
