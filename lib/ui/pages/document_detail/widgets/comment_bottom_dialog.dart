import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/comment_bloc/comment_bloc.dart';
import '../../../../constants/color_const.dart';
import '../../../../constants/font_const.dart';

class CommentBottomDialog extends StatefulWidget {
  const CommentBottomDialog(
      {Key? key, required this.commentBloc, required this.size})
      : super(key: key);

  final CommentBloc commentBloc;
  final Size size;

  @override
  State<CommentBottomDialog> createState() => _CommentBottomDialogState();
}

class _CommentBottomDialogState extends State<CommentBottomDialog> {
  TextEditingController txtController = TextEditingController();
  late CommentBloc commentBloc;
  late Size size;

  @override
  void initState() {
    super.initState();
    commentBloc = widget.commentBloc;
    size = widget.size;
    commentBloc.add(FetchCommentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bình luận",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: headLineSmall(context),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.black26,
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<CommentBloc, CommentState>(
                bloc: commentBloc,
                builder: (context, state) {
                  if (state is CommentLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CommentSuccessState) {
                    return Column(
                      children: [
                        LimitedBox(
                          maxHeight: size.height * 0.6 -
                              MediaQuery.of(context).viewInsets.bottom,
                          child: state.commentDetail.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: state.commentDetail.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var comment = state.commentDetail[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "${comment.createdBy}",
                                            style: bodyLargeBold(context),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "  -  ${comment.createdDate}",
                                                  style:
                                                      bodyLargeItalic(context)
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.grey)),
                                            ],
                                          ),
                                        ),
                                        // Text("${comment.createdBy} - ${comment.createdDate}",style: bodyLargeBold(context)),
                                        Text("${comment.content}",
                                            style: bodyLarge(context)),
                                        const SizedBox(height: 8),
                                      ],
                                    );
                                  })
                              : Center(
                                  child: Text("Chưa có bình luận nào",
                                      style: bodyLargeItalic(context)
                                          ?.copyWith(color: Colors.grey))),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black26,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 16.0, 0.0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: txtController,
                                  decoration: InputDecoration(
                                    fillColor: ColorConst.primaryBlue,
                                    border: const OutlineInputBorder(),
                                  ),
                                  maxLines: null,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                iconSize: 24.0,
                                color: ColorConst.primaryBlue,
                                onPressed: () async {
                                  var sendingPrompt =
                                      txtController.text.toString();
                                  txtController.clear();

                                  if (sendingPrompt.isNotEmpty) {
                                    commentBloc
                                        .add(PostCommentEvent(sendingPrompt));
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                  if (state is PostCommentSuccessState) {
                    commentBloc.add(FetchCommentEvent());
                  }
                  if (state is CommentFailureState) {
                    return Center(
                        child: Text(state.responseException,
                            style: headLineSmall(context)));
                  }
                  return const Center(
                      child: Text("Đã xảy ra lỗi không xác định"));
                })
          ],
        ),
      ),
    );
  }
}
