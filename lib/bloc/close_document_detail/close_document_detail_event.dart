part of 'close_document_detail_bloc.dart';

abstract class CloseDocumentDetailEvent extends Equatable {
  const CloseDocumentDetailEvent();
}

class CloseIncomingDetailEvent extends CloseDocumentDetailEvent {
  @override
  List<Object?> get props => [];
}
