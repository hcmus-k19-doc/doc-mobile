part of 'document_reminder_bloc.dart';

abstract class DocumentReminderEvent extends Equatable {
  const DocumentReminderEvent();
}

class FetchReminderMonth extends DocumentReminderEvent {
  final DateTime currentDate;

  const FetchReminderMonth(this.currentDate);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchReminderDay extends DocumentReminderEvent {
  final DateTime currentDate;

  const FetchReminderDay(this.currentDate);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FilterReminderEvent extends DocumentReminderEvent {
  final String filterValue;

  const FilterReminderEvent(this.filterValue);

  @override
  // TODO: implement props
  List<Object?> get props => [filterValue];
}
