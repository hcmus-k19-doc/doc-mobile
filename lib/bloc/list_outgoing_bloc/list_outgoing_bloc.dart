import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/pagination_outgoing_document.dart';
import 'package:flutter_app/repositories/outgoing_document_reposiroty.dart';

part 'list_outgoing_event.dart';

part 'list_outgoing_state.dart';

class ListOutgoingBloc extends Bloc<ListOutgoingEvent, ListOutgoingState> {
  OutgoingDocumentRepository outgoingRepository;
  OutgoingSearchCriteria? outgoingSearchCriteria;
  int page = 0;
  List<OutgoingDocument> listOutgoingDocument = [];

  ListOutgoingBloc(this.outgoingRepository, this.outgoingSearchCriteria)
      : super(ListOutgoingInitial()) {
    on<FetchOutgoingListDocumentEvent>((event, emit) async {
      if (state is! ListOutgoingEmpty) {
        try {
          if (state is ListOutgoingInitial) {
            emit(ListOutgoingLoading());
          }
          if (state is ListOutgoingSuccess) {
            emit(ListOutgoingFetchMore());
          }
          final response =
              await outgoingRepository.fetchPaginationOutgoingDocumentList(
                  outgoingSearchCriteria, page);
          page++;
          if (response.listOutgoingDocument!.isEmpty) {
            emit(ListOutgoingEmpty());
          } else {
            listOutgoingDocument.addAll(
                response.listOutgoingDocument as Iterable<OutgoingDocument>);
            emit(ListOutgoingSuccess(PaginationOutgoingDocument(
                totalElements: response.totalElements,
                totalPages: response.totalPages,
                listOutgoingDocument: listOutgoingDocument)));
          }
        } catch (error) {
          emit(ListOutgoingFailure(error));
        }
      }
    });
    on<FilterOutgoingListDocumentEvent>((event, emit) {
      page = 0;
      listOutgoingDocument = [];
      outgoingSearchCriteria = event.outgoingSearchCriteria;
      emit(ListOutgoingInitial());
      add(FetchOutgoingListDocumentEvent());
    });
  }
}
