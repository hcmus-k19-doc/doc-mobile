import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/document_tile.dart';
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
  late ListIncomingBloc listIncomingBloc;
  List testDocumentTile = [1, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listIncomingBloc = BlocProvider.of<ListIncomingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListIncomingBloc, ListIncomingState>(
        bloc: listIncomingBloc,
        builder: (context, state) {
          if (state is ListIncomingLoading) {
            return Column(
              children: testDocumentTile
                  .map((e) => Column(
                        children: const [
                          ShimmerLoadingDocTile(),
                          SizedBox(
                            height: StyleConst.defaultPadding,
                          )
                        ],
                      ))
                  .toList(),
            );
          } else if (state is ListIncomingSuccess) {
            return Column(children: [
              ...state.paginationIncomingDocument.listIncomingDocument!
                  .map((e) => Column(
                        children: [
                          DocumentTile(
                            incomingDocument: e,
                          ),
                          const SizedBox(
                            height: StyleConst.defaultPadding,
                          )
                        ],
                      )),
              NumberPaginator(
                numberPages: state.paginationIncomingDocument.totalPages!,
                initialPage: listIncomingBloc.initialPage,
                config: NumberPaginatorUIConfig(
                    buttonSelectedBackgroundColor:
                        Theme.of(context).primaryColor),
                onPageChange: (newPage) {
                  if (listIncomingBloc.initialPage != newPage) {
                    setState(() {
                      listIncomingBloc.initialPage = newPage;
                    });
                  }
                },
              )
            ]);
          } else if (state is ListEmptySuccess) {
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
