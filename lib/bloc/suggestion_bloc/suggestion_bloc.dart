import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';
import 'package:flutter_app/repositories/suggestion_repository.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionRepository repository;
  SuggestionBloc(this.repository) : super(SuggestionInitial()) {
    on<FetchSuggestionEvent>((event, emit) async {
      emit(SuggestionLoading());
      try {
        final documentTypeList = await repository.getDocumentTypesList();
        final distributionOrgList = await repository.getDistributionOrgList();
        emit(SuggestionEmit(documentTypeList, distributionOrgList));
      } catch (err) {
        print(err);
        emit(const SuggestionEmit([], []));
      }
    });
  }
}
