import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/close_document_detail/close_document_detail_bloc.dart';
import 'package:flutter_app/bloc/comment_bloc/comment_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/repositories/comment_repository.dart';
import 'package:flutter_app/ui/common_widgets/confirm_dialog.dart';
import 'package:flutter_app/ui/common_widgets/elevated_button.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/comment_bottom_dialog.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_attachments.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_progress_detail.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_tile_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/incoming_detail_bloc/incoming_detail_bloc.dart';
import '../../../constants/export_constants.dart';
import '../../../model/incoming_document.dart';
import '../../../repositories/incoming_document_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detailIncomingDoc,
          style: headLineSmall(context)?.copyWith(color: Colors.white),
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
                      attachments: detailDocument.attachments ?? [],
                    ),
                    Container(
                        padding:
                            const EdgeInsets.all(StyleConst.defaultPadding16),
                        child: DocumentProgressDetail(
                          processingDetail: processingDetail,
                          isOutgoing: false,
                        )),
                    Container(
                        padding:
                            const EdgeInsets.all(StyleConst.defaultPadding16),
                        child: Row(children: [
                          if (detailDocument.status != "RELEASED" &&
                              isChuyenVien(context))
                            Expanded(
                                child: CustomElevatedButton(
                              callback: () {
                                onClickPublish(
                                    context, MediaQuery.of(context).size);
                              },
                              title: AppLocalizations.of(context)!.end,
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
                            title: AppLocalizations.of(context)!.comment,
                            radius: 15,
                            buttonType: ButtonType.filledButton,
                          )),
                        ])),
                  ]));
            }
            return Center(
                child: Text("Đã xảy ra lỗi không xác định",
                    style: bodyLarge(context)));
          })),
    );
  }

  void onClickPublish(BuildContext context, Size size) {
    CloseDocumentDetailBloc closeDocumentDetailBloc = CloseDocumentDetailBloc(
        IncomingDocumentRepository(
            "${UrlConst.DOC_SERVICE_URL}/incoming-documents"),
        widget.documentId)
      ..add(CloseIncomingDetailEvent());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<CloseDocumentDetailBloc, CloseDocumentDetailState>(
              bloc: closeDocumentDetailBloc,
              builder: (context, state) {
                if (state is IncomingDocumentClosing) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  String content = AppLocalizations.of(context)!.unKnown;
                  if (state is IncomingDocumentClosedFail) {
                    content = state.result;
                  } else if (state is IncomingDocumentClosedSuccess) {
                    content = state.result;
                  }
                  return ConfirmDialog(
                    size: size,
                    content: content,
                    title: AppLocalizations.of(context)!.endDocument,
                    onRightButton: () {
                      Navigator.of(context).pop();
                    },
                    onLeftButton: () {},
                    leftButton: '',
                    rightButton: AppLocalizations.of(context)!.close,
                    hasLeftButton: false,
                  );
                }
              });
        });
  }

  void onClickCommentButton(Size size) {
    CommentBloc commentBloc = CommentBloc(
        CommentRepository("${UrlConst.DOC_SERVICE_URL}/comments"),
        widget.documentId,
        false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        return CommentBottomDialog(commentBloc: commentBloc, size: size);
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
