import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/comment_detail.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/comment_repository.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/repositories/outgoing_document_repository.dart';

part 'outgoing_detail_event.dart';

part 'outgoing_detail_state.dart';

class OutgoingDetailBloc
    extends Bloc<OutgoingDetailEvent, OutgoingDetailState> {
  OutgoingDocumentRepository outgoingRepository;
  IncomingDocumentRepository incomingRepository;
  int documentId;

  OutgoingDetailBloc(
      this.outgoingRepository, this.incomingRepository, this.documentId)
      : super(OutgoingDetailLoadingState()) {
    on<FetchOutgoingDetailEvent>((event, emit) async {
      emit(OutgoingDetailLoadingState());
      try {
        final outgoingDocument =
            await outgoingRepository.getOutgoingDocumentDetailById(documentId);
        final processingDetail =
            await incomingRepository.getOutgoingDocumentProcessById(documentId);
        // emit(OutgoingDetailSuccessState(outgoingDocument));
        emit(OutgoingDetailSuccessState(outgoingDocument, processingDetail));
      } catch (e) {
        print(e);

        emit(OutgoingDetailFailureState(e.toString()));
      }
    });
  }
}
