part of 'transfer_history_bloc.dart';

abstract class TransferHistoryEvent extends Equatable {
  const TransferHistoryEvent();
}

class FetchTransferHistoryEvent extends TransferHistoryEvent {
  final int userId;

  const FetchTransferHistoryEvent(this.userId);
  @override
  List<Object?> get props => [];
}
