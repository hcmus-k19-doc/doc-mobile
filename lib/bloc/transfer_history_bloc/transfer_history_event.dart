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

class FetchNumberTransferHistoryEvent extends TransferHistoryEvent {
  final int userId;

  const FetchNumberTransferHistoryEvent(this.userId);
  @override
  List<Object?> get props => [];
}

class FetchMoreTransferHistoryEvent extends TransferHistoryEvent {
  final int userId;

  const FetchMoreTransferHistoryEvent(this.userId);
  @override
  List<Object?> get props => [];
}

class ReadAHistoryEvent extends TransferHistoryEvent {
  final int docId;
  final bool isRead;
  const ReadAHistoryEvent(this.docId, this.isRead);
  @override
  List<Object?> get props => [];
}

class MarkReadAllEvent extends TransferHistoryEvent {
  const MarkReadAllEvent();
  @override
  List<Object?> get props => [];
}
