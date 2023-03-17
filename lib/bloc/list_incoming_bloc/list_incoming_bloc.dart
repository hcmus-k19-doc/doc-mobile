import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';

part 'list_incoming_event.dart';
part 'list_incoming_state.dart';

class ListIncomingBloc extends Bloc<ListIncomingEvent, ListIncomingState> {
  IncomingDocumentRepositoryImpl repository;
  ListIncomingBloc(this.repository) : super(ListIncomingInitial()) {
    on<FetchIncomingListDocumentEvent>((event, emit) async {
      if (state is! ListIncomingSuccess) {
        emit(ListIncomingLoading());
        try {
          final listIncomingDoc = await repository.getIncomingDocumentList();
          emit(ListIncomingSuccess(listIncomingDoc));
        } catch (err) {
          emit(ListIncomingFailure(err));
        }
      }
    });
  }
}
