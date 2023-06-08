part of 'transfer_history_bloc.dart';

abstract class TransferHistoryState extends Equatable {
  const TransferHistoryState();
  @override
  List<Object> get props => [];
}

class TransferHistoryInitial extends TransferHistoryState {}

class TransferHistoryLoading extends TransferHistoryState {}

class TransferHistorySuccess extends TransferHistoryState {
  final List<TransferHistory> listTransferHistory;

  const TransferHistorySuccess(this.listTransferHistory);

  @override
  List<Object> get props => [listTransferHistory];
}

class TransferHistoryEmpty extends TransferHistoryState {}

class TransferHistoryFetchMore extends TransferHistoryState {}

class TransferHistoryFailure extends TransferHistoryState {
  final Object responseExeption;

  const TransferHistoryFailure(this.responseExeption);
}
