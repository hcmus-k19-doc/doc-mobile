import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'incoming_detail_event.dart';

part 'incoming_detail_state.dart';

class IncomingDetailBloc extends Bloc<IncomingDetailEvent, IncomingDetailState> {
  IncomingDocumentRepository repository;
  int documentId;

  IncomingDetailBloc(this.repository, this.documentId) : super(IncomingDetailLoadingState()) {
    on<FetchIncomingDetailEvent>((event, emit) async {
     emit(IncomingDetailLoadingState());
     try {
       final incomingDocument = await repository.getIncomingDocumentDetailById(documentId);
       emit(IncomingDetailSuccessState(incomingDocument));
     } catch (e) {
       emit(IncomingDetailFailureState(e.toString()));
     }
    });
  }
}
