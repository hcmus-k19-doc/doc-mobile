import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/incoming_document_detail/widgets/document_progress_detail.dart';
import 'package:flutter_app/ui/pages/incoming_document_detail/widgets/document_tile_detail.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/export_constants.dart';
import '../../../model/incoming_document.dart';
import '../list_incoming_doc/widgets/document_tile.dart';

class IncomingDocumentDetail extends StatefulWidget {
  const IncomingDocumentDetail({Key? key, required this.documentId}) : super(key: key);
  final int documentId;

  @override
  State<IncomingDocumentDetail> createState() => _IncomingDocumentDetailState();
}

class _IncomingDocumentDetailState extends State<IncomingDocumentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chi tiết văn bản đến",
          style: headLineSmall(context)?.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(StyleConst.defaultPadding16),
            child: DocumentTileDetail(incomingDocument: IncomingDocument(),)),
        Container(
            padding: const EdgeInsets.all(StyleConst.defaultPadding16),
            child: DocumentProgressDetail(incomingDocument: IncomingDocument(),))
      ]
      )),
        backgroundColor: ColorConst.white,
      );
  }
}
