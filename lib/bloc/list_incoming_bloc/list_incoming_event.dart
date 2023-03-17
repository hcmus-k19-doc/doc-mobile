part of 'list_incoming_bloc.dart';

abstract class ListIncomingEvent extends Equatable {
  const ListIncomingEvent();
}

class FetchIncomingListDocumentEvent extends ListIncomingEvent {
  @override
  List<Object?> get props => [];
}
