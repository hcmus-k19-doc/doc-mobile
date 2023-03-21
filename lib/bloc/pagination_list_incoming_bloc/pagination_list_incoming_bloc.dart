import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'pageination_list_incoming_event.dart';
part 'pagination_list_incoming_state.dart';

class PaginationListIncomingBloc
    extends Bloc<PaginationListIncomingEvent, PaginationListIncomingState> {
  IncomingDocumentRepository repository;
  SearchCriteria? searchCriteria;
  PaginationListIncomingBloc(this.repository, this.searchCriteria)
      : super(PaginationListIncomingInitial()) {
    on<FetchPaginationIncomingListDocumentEvent>((event, emit) async {
      emit(PaginationListIncomingInitial());
      emit(PaginationListIncomingLoading());
      try {
        final paginationIncomingDocuments =
            await repository.getPaginationIncomingDocumentList(searchCriteria);
        if (paginationIncomingDocuments.listIncomingDocument!.isEmpty) {
          emit(PaginationListEmptySuccess());
        } else {
          emit(PaginationListIncomingSuccess(paginationIncomingDocuments));
        }
      } catch (err) {
        emit(PaginationListIncomingFailure(err));
      }
    });
  }
}
