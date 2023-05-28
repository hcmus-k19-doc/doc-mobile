part of 'close_document_detail.dart';

abstract class IncomingDetailState extends Equatable {
  const IncomingDetailState();

  @override
  List<Object?> get props => [];
}

class IncomingDetailLoadingState extends IncomingDetailState {}

class IncomingDetailSuccessState extends IncomingDetailState {
  final IncomingDocument incomingDocumentDetail;
  final List<ProcessingDetail> processingDetail;

  const IncomingDetailSuccessState(this.incomingDocumentDetail, this.processingDetail);

  @override
  List<Object?> get props => [incomingDocumentDetail];
}

class IncomingDetailFailureState extends IncomingDetailState {
  final String responseException;

  const IncomingDetailFailureState(this.responseException);
}

class IncomingDocumentClosing extends IncomingDetailState {}

class IncomingDocumentClosed extends IncomingDetailState {
  final String result;

  const IncomingDocumentClosed(this.result);
}
