import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'list_incoming_doc_event.dart';
part 'list_incoming_doc_state.dart';

class ListIncomingDocBloc
    extends Bloc<ListIncomingDocEvent, ListIncomingDocState> {
  IncomingDocumentRepository repository;
  ListIncomingDocBloc(this.repository) : super(ListIncomingDocInitial()) {
    on<FetchIncomingDocumentOnPage>((event, emit) async {
      emit(ListIncomingDocLoading());
      try {
        final listIncomingDocument = await repository.getDocumentOnPage(
            event.page, event.searchCriteria);

        emit(ListIncomingDocSuccess(listIncomingDocument));
      } catch (error) {
        emit(ListIncomingDocFailure());
      }
    });
  }
}
