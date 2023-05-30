part of 'list_outgoing_bloc.dart';

abstract class ListOutgoingEvent extends Equatable {
  const ListOutgoingEvent();
}

class FetchOutgoingListDocumentEvent extends ListOutgoingEvent {
  @override
  List<Object?> get props => [];
}

class FilterOutgoingListDocumentEvent extends ListOutgoingEvent {
  OutgoingSearchCriteria? outgoingSearchCriteria;

  FilterOutgoingListDocumentEvent(this.outgoingSearchCriteria);

  @override
  List<Object?> get props => [outgoingSearchCriteria];
}
