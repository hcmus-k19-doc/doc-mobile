part of 'list_outgoing_bloc.dart';

abstract class ListOutgoingState extends Equatable {
  const ListOutgoingState();

  @override
  List<Object> get props => [];
}

class ListOutgoingInitial extends ListOutgoingState {}

class ListOutgoingLoading extends ListOutgoingState {}

class ListOutgoingSuccess extends ListOutgoingState {
  final PaginationOutgoingDocument paginationOutgoingDocument;

  const ListOutgoingSuccess(this.paginationOutgoingDocument);
  @override
  List<Object> get props => [paginationOutgoingDocument];
}

class ListOutgoingEmpty extends ListOutgoingState {}

class ListOutgoingFetchMore extends ListOutgoingState {}

class ListOutgoingFailure extends ListOutgoingState {
  final Object responseExeption;

  const ListOutgoingFailure(this.responseExeption);
}
