part of 'pagination_list_incoming_bloc.dart';

abstract class PaginationListIncomingState extends Equatable {
  const PaginationListIncomingState();
  @override
  List<Object?> get props => [];
}

class PaginationListIncomingInitial extends PaginationListIncomingState {}

class PaginationListIncomingLoading extends PaginationListIncomingState {}

class PaginationListIncomingSuccess extends PaginationListIncomingState {
  PaginationIncomingDocument paginationIncomingDocument;
  PaginationListIncomingSuccess(this.paginationIncomingDocument);
}

class PaginationListEmptySuccess extends PaginationListIncomingState {}

class PaginationListIncomingFailure extends PaginationListIncomingState {
  final Object responeExeption;

  const PaginationListIncomingFailure(this.responeExeption);
}
