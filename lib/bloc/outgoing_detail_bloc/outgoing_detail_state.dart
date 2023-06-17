part of 'outgoing_detail_bloc.dart';

abstract class OutgoingDetailState extends Equatable {
  const OutgoingDetailState();

  @override
  List<Object?> get props => [];
}

class OutgoingDetailLoadingState extends OutgoingDetailState {}

class OutgoingDetailSuccessState extends OutgoingDetailState {
  final OutgoingDocument outgoingDocumentDetail;
  final List<ProcessingDetail> processingDetail;

  // const OutgoingDetailSuccessState(this.outgoingDocumentDetail);
  const OutgoingDetailSuccessState(this.outgoingDocumentDetail, this.processingDetail);

  @override
  List<Object?> get props => [outgoingDocumentDetail];
}

class OutgoingDetailFailureState extends OutgoingDetailState {
  final String responseException;

  const OutgoingDetailFailureState(this.responseException);
}
