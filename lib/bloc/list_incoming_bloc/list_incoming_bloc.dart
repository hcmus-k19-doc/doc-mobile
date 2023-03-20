import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/list_coming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'list_incoming_event.dart';
part 'list_incoming_state.dart';

class ListIncomingBloc extends Bloc<ListIncomingEvent, ListIncomingState> {
  IncomingDocumentRepository repository;
  SearchCriteria? searchCriteria;
  int initialPage = 0;
  ListIncomingBloc(this.repository, this.searchCriteria)
      : super(ListIncomingInitial()) {
    on<FetchIncomingListDocumentEvent>((event, emit) async {
      emit(ListIncomingLoading());
      try {
        final paginationIncomingDocuments =
            await repository.getPaginationIncomingDocumentList(searchCriteria);
        if (paginationIncomingDocuments.listIncomingDocument!.isEmpty) {
          emit(ListEmptySuccess());
        } else {
          emit(ListIncomingSuccess(paginationIncomingDocuments));
        }
      } catch (err) {
        emit(ListIncomingFailure(err));
      }
    });
  }
}
