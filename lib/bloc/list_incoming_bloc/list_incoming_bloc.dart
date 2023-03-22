import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'list_incoming_event.dart';

part 'list_incoming_state.dart';

class ListIncomingBloc extends Bloc<ListIncomingEvent, ListIncomingState> {
  IncomingDocumentRepository repository;
  SearchCriteria? searchCriteria;
  int page = 0;
  List<IncomingDocument> listIncomingDocument = [];

  ListIncomingBloc(this.repository, this.searchCriteria)
      : super(ListIncomingInitial()) {
    on<FetchIncomingListDocumentEvent>((event, emit) async {
      if (state is! ListIncomingEmpty) {
        try {
          if (state is ListIncomingInitial) {
            emit(ListIncomingLoading());
          }
          if (state is ListIncomingSuccess) {
            emit(ListIncomingFetchMore());
          }
          final response = await repository.fetchPaginationIncomingDocumentList(
              searchCriteria, page);
          page++;
          if (response.listIncomingDocument!.isEmpty) {
            emit(ListIncomingEmpty());
          } else {
            listIncomingDocument.addAll(
                response.listIncomingDocument as Iterable<IncomingDocument>);
            emit(ListIncomingSuccess(PaginationIncomingDocument(
                totalElements: response.totalElements,
                totalPages: response.totalPages,
                listIncomingDocument: listIncomingDocument)));
          }
        } catch (err) {
          emit(ListIncomingFailure(err));
        }
      }
    });
    on<FilterIncomingListDocumentEvent>((event, emit) {
      page = 0;
      listIncomingDocument = [];
      searchCriteria = event.searchCriteria;
      emit(ListIncomingInitial());
      add(FetchIncomingListDocumentEvent());
    });
  }
}
