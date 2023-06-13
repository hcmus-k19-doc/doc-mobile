import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/comment_bloc/comment_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_app/repositories/comment_repository.dart';
import 'package:flutter_app/ui/common_widgets/elevated_button.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/comment_bottom_dialog.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/document_attachments.dart';
import 'package:flutter_app/ui/pages/document_detail/widgets/out_document_tile_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../bloc/outgoing_detail_bloc/outgoing_detail_bloc.dart';
import '../../../constants/export_constants.dart';
import '../../../repositories/outgoing_document_repository.dart';

class OutgoingDocumentDetail extends StatefulWidget {
  const OutgoingDocumentDetail({Key? key, required this.documentId})
      : super(key: key);
  final int documentId;

  @override
  State<OutgoingDocumentDetail> createState() => _OutgoingDocumentDetailState();
}

class _OutgoingDocumentDetailState extends State<OutgoingDocumentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        title: Text(
          "Chi tiết văn bản đi",
          style: headLineSmall(context)?.copyWith(color: Colors.white),
        ),
      ),
      body: BlocProvider(
          create: (context) => OutgoingDetailBloc(
              OutgoingDocumentRepository(
                  "${UrlConst.DOC_SERVICE_URL}/outgoing-documents"),
              widget.documentId)
            ..add(FetchOutgoingDetailEvent()),
          child: BlocBuilder<OutgoingDetailBloc, OutgoingDetailState>(
              builder: (context, state) {
            if (state is OutgoingDetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is OutgoingDetailFailureState) {
              return Center(
                  child: Text(state.responseException,
                      style: headLineSmall(context)));
            }
            if (state is OutgoingDetailSuccessState) {
              OutgoingDocument detailDocument = state.outgoingDocumentDetail;
              // List<ProcessingDetail> processingDetail = state.processingDetail;
              return SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                        padding:
                            const EdgeInsets.all(StyleConst.defaultPadding16),
                        child: OutDocumentTileDetail(
                            outgoingDocument: detailDocument)),
                      const DocumentAttachment(
                        incomingDocument: null,
                      ),
                      Container(
                          padding:
                              const EdgeInsets.all(StyleConst.defaultPadding16),
                          child: Row(children: [
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

  void onClickCommentButton(Size size) {
    CommentBloc commentBloc = CommentBloc(
        CommentRepository("${UrlConst.DOC_SERVICE_URL}/comments"),
        widget.documentId);

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
        return CommentBottomDialog(commentBloc: commentBloc, size: size);
      },
    );
  }

  bool isVanThu(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    if (authBloc.profile?.role == "VAN_THU") {
      return true;
    } else {
      return false;
    }
  }
}
