part of 'list_incoming_doc_bloc.dart';

abstract class ListIncomingDocEvent extends Equatable {
  const ListIncomingDocEvent();
}

class FetchIncomingDocumentOnPage extends ListIncomingDocEvent {
  final int page;
  final SearchCriteria? searchCriteria;

  const FetchIncomingDocumentOnPage(this.page, this.searchCriteria);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
