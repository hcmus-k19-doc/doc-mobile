import 'package:flutter_app/bloc/incoming_detail_bloc/incoming_detail_bloc.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';

part 'close_document_detail_event.dart';
part 'close_document_detail_state.dart';

class CloseDocumentDetailBloc extends Bloc<CloseDocumentDetailEvent, CloseDocumentDetailState> {
  IncomingDocumentRepository incomingRepository;
  int documentId;

  CloseDocumentDetailBloc(this.incomingRepository, this.documentId) : super(IncomingDocumentClosing()) {
    on<CloseIncomingDetailEvent>((event, emit) async {
      emit(IncomingDocumentClosing());
      try {
        await incomingRepository.closeIncomingDocument(documentId);
        emit(const IncomingDocumentClosedSuccess("Kết thúc văn bản thành công"));
      } catch (e) {
        emit (IncomingDocumentClosedFail(e.toString()));
      }
    });
  }
}
