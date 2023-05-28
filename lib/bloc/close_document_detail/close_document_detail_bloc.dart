import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/comment_detail.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/comment_repository.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'incoming_detail_event.dart';

part 'incoming_detail_state.dart';

class CloseDocumentDetailBloc extends Bloc<CloseDocumentDetailEvent, IncomingDetailState> {
  IncomingDocumentRepository incomingRepository;
  int documentId;

  CloseDocumentDetailBloc(this.incomingRepository, this.documentId) : super(IncomingDetailLoadingState()) {
    on<CloseIncomingDetailEvent>((event, emit) async {
      emit(IncomingDocumentClosing());
      try {
        await incomingRepository.closeIncomingDocument(documentId);
        emit(const IncomingDocumentClosed("Kết thúc văn bản thành công"));
      } catch (e) {
        emit (IncomingDocumentClosed(e.toString()));
      }
    });
  }
}
