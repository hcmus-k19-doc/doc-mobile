part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class FetchCommentEvent extends CommentEvent {
  @override
  List<Object?> get props => [];
}

class PostCommentEvent extends CommentEvent {
  final String comment;

  const PostCommentEvent(this.comment);

  @override
  List<Object?> get props => [comment];
}

