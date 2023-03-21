part of 'pagination_list_incoming_bloc.dart';

abstract class PaginationListIncomingEvent extends Equatable {
  const PaginationListIncomingEvent();
}

class FetchPaginationIncomingListDocumentEvent
    extends PaginationListIncomingEvent {
  @override
  List<Object?> get props => [];
}
