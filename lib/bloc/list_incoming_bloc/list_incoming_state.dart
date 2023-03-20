part of 'list_incoming_bloc.dart';

abstract class ListIncomingState extends Equatable {
  const ListIncomingState();
  @override
  List<Object?> get props => [];
}

class ListIncomingInitial extends ListIncomingState {}

class ListIncomingLoading extends ListIncomingState {}

class ListIncomingSuccess extends ListIncomingState {
  PaginationIncomingDocument paginationIncomingDocument;
  ListIncomingSuccess(this.paginationIncomingDocument);
}

class ListEmptySuccess extends ListIncomingState {}

class ListIncomingFailure extends ListIncomingState {
  final Object responeExeption;

  const ListIncomingFailure(this.responeExeption);
}
