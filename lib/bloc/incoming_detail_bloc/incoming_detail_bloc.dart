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

class IncomingDetailBloc extends Bloc<IncomingDetailEvent, IncomingDetailState> {
  IncomingDocumentRepository incomingRepository;
  int documentId;

  IncomingDetailBloc(this.incomingRepository, this.documentId) : super(IncomingDetailLoadingState()) {
    on<FetchIncomingDetailEvent>((event, emit) async {
     emit(IncomingDetailLoadingState());
     try {
       final incomingDocument = await incomingRepository.getIncomingDocumentDetailById(documentId);
       final processingDetail = await incomingRepository.getIncomingDocumentProcessByI(documentId);
       emit(IncomingDetailSuccessState(incomingDocument, processingDetail));
     } catch (e) {
       emit(IncomingDetailFailureState(e.toString()));
     }
    });
  }
}
