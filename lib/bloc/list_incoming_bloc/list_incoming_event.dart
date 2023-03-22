part of 'list_incoming_bloc.dart';

abstract class ListIncomingEvent extends Equatable {
  const ListIncomingEvent();
}

class FetchIncomingListDocumentEvent extends ListIncomingEvent {
  @override
  List<Object?> get props => [];
}

class FilterIncomingListDocumentEvent extends ListIncomingEvent {
  SearchCriteria? searchCriteria;

  FilterIncomingListDocumentEvent(this.searchCriteria);

  @override
  List<Object?> get props => [searchCriteria];
}
