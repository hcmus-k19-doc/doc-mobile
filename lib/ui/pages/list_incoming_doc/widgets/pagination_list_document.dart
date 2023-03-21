import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_doc_bloc.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/document_tile.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/shimmer_document_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

class PaginationListDocument extends StatefulWidget {
  const PaginationListDocument(
      {Key? key,
      required this.listInitialDocument,
      required this.totalPages,
      this.searchCriteria})
      : super(key: key);
  final List<IncomingDocument> listInitialDocument;
  final int totalPages;
  final SearchCriteria? searchCriteria;

  @override
  State<PaginationListDocument> createState() => _PaginationListDocumentState();
}

class _PaginationListDocumentState extends State<PaginationListDocument> {
  int currentPage = 0;
  int orderNumber = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListIncomingDocBloc(IncomingDocumentRepository(
          "${UrlConst.DOC_SERVICE_URL}/incoming-documents")),
      child: BlocBuilder<ListIncomingDocBloc, ListIncomingDocState>(
        builder: (context, listIncomingState) {
          return Column(children: [
            if (listIncomingState is ListIncomingDocLoading)
              Column(
                children: List.generate(
                    3,
                    (index) => Column(
                          children: const [
                            ShimmerLoadingDocTile(),
                            SizedBox(
                              height: StyleConst.defaultPadding,
                            )
                          ],
                        )).toList(),
              )
            else if (listIncomingState is ListIncomingDocSuccess)
              Column(
                children: listIncomingState.listIncomingDocument.map((e) {
                  orderNumber++;
                  return Column(
                    children: [
                      DocumentTile(
                        incomingDocument: e,
                        numberOrderTile: orderNumber,
                      ),
                      const SizedBox(
                        height: StyleConst.defaultPadding,
                      )
                    ],
                  );
                }).toList(),
              )
            else if (listIncomingState is ListIncomingDocInitial)
              Column(
                children: widget.listInitialDocument.map((e) {
                  orderNumber++;
                  return Column(
                    children: [
                      DocumentTile(
                        incomingDocument: e,
                        numberOrderTile: orderNumber,
                      ),
                      const SizedBox(
                        height: StyleConst.defaultPadding,
                      )
                    ],
                  );
                }).toList(),
              )
            else
              Center(
                child: Text(
                  "Xảy ra lỗi trong lúc lấy dữ liệu",
                  style: bodyLargeBold(context)
                      ?.copyWith(fontSize: 20, color: Colors.red),
                ),
              ),
            NumberPaginator(
              numberPages: widget.totalPages,
              initialPage: currentPage,
              config: NumberPaginatorUIConfig(
                  buttonSelectedBackgroundColor:
                      Theme.of(context).primaryColor),
              onPageChange: (newPage) {
                currentPage = newPage;
                orderNumber = currentPage * widget.listInitialDocument.length;
                BlocProvider.of<ListIncomingDocBloc>(context).add(
                    FetchIncomingDocumentOnPage(
                        currentPage, widget.searchCriteria));
              },
            )
          ]);
        },
      ),
    );
  }
}
