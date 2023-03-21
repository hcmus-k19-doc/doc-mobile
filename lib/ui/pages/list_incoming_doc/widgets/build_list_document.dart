import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_doc_bloc.dart';
import 'package:flutter_app/bloc/pagination_list_incoming_bloc/pagination_list_incoming_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/document_tile.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/pagination_list_document.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/shimmer_document_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

class BuildListIncomingDocument extends StatefulWidget {
  const BuildListIncomingDocument({Key? key}) : super(key: key);

  @override
  State<BuildListIncomingDocument> createState() =>
      _BuildListIncomingDocumentState();
}

class _BuildListIncomingDocumentState extends State<BuildListIncomingDocument> {
  late PaginationListIncomingBloc paginationListIncomingBloc;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paginationListIncomingBloc =
        BlocProvider.of<PaginationListIncomingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaginationListIncomingBloc,
            PaginationListIncomingState>(
        bloc: paginationListIncomingBloc,
        listener: (context, state) {
          if (state is PaginationListIncomingInitial) {
            currentPage = 0;
          }
        },
        builder: (context, paginationState) {
          if (paginationState is PaginationListIncomingLoading ||
              paginationState is PaginationListIncomingInitial) {
            return Column(
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
            );
          } else if (paginationState is PaginationListIncomingSuccess) {
            return PaginationListDocument(
              listInitialDocument: paginationState
                  .paginationIncomingDocument.listIncomingDocument!,
              totalPages:
                  paginationState.paginationIncomingDocument.totalPages!,
              searchCriteria: paginationListIncomingBloc.searchCriteria,
            );
          } else if (paginationState is PaginationListEmptySuccess) {
            return Center(
              child: Text(
                "Không có dữ liệu",
                style: bodyLargeBold(context)?.copyWith(fontSize: 20),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Xảy ra lỗi trong lúc lấy dữ liệu",
                style: bodyLargeBold(context)
                    ?.copyWith(fontSize: 20, color: Colors.red),
              ),
            );
          }
        });
  }
}
