part of 'list_incoming_bloc.dart';

abstract class ListIncomingEvent extends Equatable {
  const ListIncomingEvent();
}

class FetchIncomingListDocumentEvent extends ListIncomingEvent {
  SearchCriteria? searchCriteria;

  FetchIncomingListDocumentEvent({this.searchCriteria});

  @override
  List<Object?> get props => [];
}
