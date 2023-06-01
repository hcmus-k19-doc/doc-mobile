import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/close_document_detail/close_document_detail_bloc.dart';
import 'package:flutter_app/bloc/comment_bloc/comment_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/repositories/comment_repository.dart';
import 'package:flutter_app/ui/common_widgets/confirm_dialog.dart';
import 'package:flutter_app/ui/common_widgets/elevated_button.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_attachments.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_progress_detail.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_tile_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/incoming_detail_bloc/incoming_detail_bloc.dart';
import '../../../constants/export_constants.dart';
import '../../../model/incoming_document.dart';
import '../../../repositories/incoming_document_repository.dart';

class IncomingDocumentDetail extends StatefulWidget {
  const IncomingDocumentDetail({Key? key, required this.documentId})
      : super(key: key);
  final int documentId;

  @override
  State<IncomingDocumentDetail> createState() => _IncomingDocumentDetailState();
}

class _IncomingDocumentDetailState extends State<IncomingDocumentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConst.white,
        appBar: AppBar(
          title: Text(
            "Chi tiết văn bản đến",
            style: headLineSmall(context)
                ?.copyWith(color: Colors.white, fontSize: 18),
          ),
        ),
        body: BlocProvider(
          create: (context) => IncomingDetailBloc(
              IncomingDocumentRepository(
                  "${UrlConst.DOC_SERVICE_URL}/incoming-documents"),
              widget.documentId)
            ..add(FetchIncomingDetailEvent()),
          child: BlocBuilder<IncomingDetailBloc, IncomingDetailState>(
              builder: (context, state) {
            if (state is IncomingDetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is IncomingDetailFailureState) {
              return Center(
                      child: Text(state.responseException,
                          style: headLineSmall(context)));
            }
            if (state is IncomingDetailSuccessState) {
              IncomingDocument detailDocument = state.incomingDocumentDetail;
              List<ProcessingDetail> processingDetail = state.processingDetail;
              return SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                          padding:
                              const EdgeInsets.all(StyleConst.defaultPadding16),
                          child: DocumentTileDetail(
                            incomingDocument: detailDocument,
                          )),
                      DocumentAttachment(
                        incomingDocument: detailDocument,
                      ),
                      Container(
                          padding:
                              const EdgeInsets.all(StyleConst.defaultPadding16),
                          child: DocumentProgressDetail(
                            processingDetail: processingDetail,
                          )),
                      Container(
                          padding:
                              const EdgeInsets.all(StyleConst.defaultPadding16),
                          child: Row(children: [
                            if (detailDocument.status != "RELEASED" && isChuyenVien(context))
                            Expanded(
                                child: CustomElevatedButton(
                              callback: () {
                                onClickPublish(context, MediaQuery.of(context).size);
                              },
                              title: 'Kết thúc',
                              radius: 15,
                              buttonType: ButtonType.filledButton,
                            )),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                                child: CustomElevatedButton(
                              callback: () {
                                Size size = MediaQuery.of(context).size;
                                onClickCommentButton(size);
                              },
                              title: 'Góp ý',
                              radius: 15,
                              buttonType: ButtonType.filledButton,
                            )),
                          ])),
                    ]));
            }
            return const Center(child: Text("Đã xảy ra lỗi không xác định"));
          })),
    );
  }

  void onClickPublish(BuildContext context, Size size) {
    CloseDocumentDetailBloc closeDocumentDetailBloc = CloseDocumentDetailBloc(
        IncomingDocumentRepository("${UrlConst.DOC_SERVICE_URL}/incoming-documents"),
        widget.documentId)..add(CloseIncomingDetailEvent());

    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return BlocBuilder<CloseDocumentDetailBloc, CloseDocumentDetailState>(
          bloc: closeDocumentDetailBloc,
          builder: (context, state) {
            if (state is IncomingDocumentClosing) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else  {
              String content = "Không xác định";
              if (state is IncomingDocumentClosedFail) {
                content = state.result;
              } else if (state is IncomingDocumentClosedSuccess) {
                content = state.result;
              }
              return  ConfirmDialog(
                size: size,
                content: content,
                title: 'Kết thúc văn bản',
                onRightButton: () {
                  Navigator.of(context).pop();
                },
                onLeftButton: () {},
                leftButton: '',
                rightButton: 'Đóng',
                hasLeftButton: false,
              );
            }
          });
    }
    );
  }

  void onClickCommentButton(Size size) {
    CommentBloc commentBloc = CommentBloc(
        CommentRepository("${UrlConst.DOC_SERVICE_URL}/comments"),
        widget.documentId)
      ..add(FetchCommentEvent());
    TextEditingController txtController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
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
                                        var comment =
                                            state.commentDetail[index];
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
                                                      style: bodyLargeItalic(
                                                              context)
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
                              padding:
                                  const EdgeInsets.fromLTRB(0, 16.0, 0.0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: txtController,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.blue,
                                        border: OutlineInputBorder(),
                                      ),
                                      maxLines: null,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    iconSize: 24.0,
                                    color: Colors.blue,
                                    onPressed: () async {
                                      var sendingPrompt =
                                          txtController.text.toString();
                                      txtController.clear();

                                      if (sendingPrompt.isNotEmpty) {
                                        commentBloc.add(
                                            PostCommentEvent(sendingPrompt));
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
      },
    );
  }

  bool isChuyenVien(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    if (authBloc.profile?.role == "CHUYEN_VIEN") {
      return true;
    } else {
      return false;
    }
  }
}
