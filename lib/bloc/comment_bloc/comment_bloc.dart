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

part 'comment_event.dart';

part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentRepository repository;
  int documentId;

  CommentBloc(this.repository, this.documentId) : super(CommentLoadingState()) {
    on<FetchCommentEvent>((event, emit) async {
     emit(CommentLoadingState());
     try {
       final comments = await repository.getCommentsById(documentId);
       emit(CommentSuccessState(comments));
     } catch (e) {
       emit(CommentFailureState(e.toString()));
     }
    });
    on<PostCommentEvent>((event, emit) async {
      emit(CommentLoadingState());
      try {
        await repository.postComment(documentId, event.comment);
        emit(PostCommentSuccessState());
      } catch(e) {
        emit(CommentFailureState(e.toString()));
      }
    });
  }
}
