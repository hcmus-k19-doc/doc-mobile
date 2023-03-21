part of 'list_incoming_doc_bloc.dart';

abstract class ListIncomingDocState extends Equatable {
  const ListIncomingDocState();
  @override
  List<Object> get props => [];
}

class ListIncomingDocInitial extends ListIncomingDocState {}

class ListIncomingDocLoading extends ListIncomingDocState {}

class ListIncomingDocSuccess extends ListIncomingDocState {
  final List<IncomingDocument> listIncomingDocument;
  const ListIncomingDocSuccess(this.listIncomingDocument);
}

class ListIncomingDocFailure extends ListIncomingDocState {}
