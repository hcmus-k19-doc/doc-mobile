part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object?> get props => [];
}

class CommentLoadingState extends CommentState {}

class CommentSuccessState extends CommentState {
  final List<Comment> commentDetail;

  const CommentSuccessState(this.commentDetail);

  @override
  List<Object?> get props => [commentDetail];
}

class PostCommentSuccessState extends CommentState {}

class CommentFailureState extends CommentState {
  final String responseException;

  const CommentFailureState(this.responseException);
}
