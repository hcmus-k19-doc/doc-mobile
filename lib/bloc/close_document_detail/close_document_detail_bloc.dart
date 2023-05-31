import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

import '../../model/incoming_document.dart';
import '../../model/processing_detail.dart';

part 'close_document_detail_event.dart';
part 'close_document_detail_state.dart';

class CloseDocumentDetailBloc
    extends Bloc<CloseDocumentDetailEvent, IncomingDetailState> {
  IncomingDocumentRepository incomingRepository;
  int documentId;

  CloseDocumentDetailBloc(this.incomingRepository, this.documentId)
      : super(IncomingDetailLoadingState()) {
    on<CloseIncomingDetailEvent>((event, emit) async {
      emit(IncomingDocumentClosing());
      try {
        await incomingRepository.closeIncomingDocument(documentId);
        emit(const IncomingDocumentClosed("Kết thúc văn bản thành công"));
      } catch (e) {
        emit(IncomingDocumentClosed(e.toString()));
      }
    });
  }
}
