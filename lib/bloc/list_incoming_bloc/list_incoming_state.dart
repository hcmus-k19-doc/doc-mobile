part of 'list_incoming_bloc.dart';

abstract class ListIncomingState extends Equatable {
  const ListIncomingState();

  @override
  List<Object?> get props => [];
}

class ListIncomingInitial extends ListIncomingState {}

class ListIncomingLoading extends ListIncomingState {}

class ListIncomingSuccess extends ListIncomingState {
  final PaginationIncomingDocument paginationIncomingDocument;

  const ListIncomingSuccess(this.paginationIncomingDocument);

  @override
  List<Object?> get props => [paginationIncomingDocument];
}

class ListIncomingEmpty extends ListIncomingState {}

class ListIncomingFetchMore extends ListIncomingState {}

class ListIncomingFailure extends ListIncomingState {
  final Object responseExeption;

  const ListIncomingFailure(this.responseExeption);
}
