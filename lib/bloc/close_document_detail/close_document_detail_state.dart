part of 'close_document_detail_bloc.dart';

abstract class CloseDocumentDetailState extends Equatable {
  const CloseDocumentDetailState();

  @override
  List<Object?> get props => [];
}

class IncomingDocumentClosedSuccess extends CloseDocumentDetailState {
  final String result;

  const IncomingDocumentClosedSuccess(this.result);
}

class IncomingDocumentClosedFail extends CloseDocumentDetailState {
  final String result;

  const IncomingDocumentClosedFail(this.result);
}

class IncomingDocumentClosing extends CloseDocumentDetailState {}
