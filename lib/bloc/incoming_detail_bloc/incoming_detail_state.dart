part of 'incoming_detail_bloc.dart';

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
