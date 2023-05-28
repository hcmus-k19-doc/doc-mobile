part of 'close_document_detail.dart';

abstract class IncomingDetailEvent extends Equatable {
  const IncomingDetailEvent();
}

class FetchIncomingDetailEvent extends IncomingDetailEvent {
  @override
  List<Object?> get props => [];
}

class CloseIncomingDetailEvent extends IncomingDetailEvent {
  @override
  List<Object?> get props => [];
}
