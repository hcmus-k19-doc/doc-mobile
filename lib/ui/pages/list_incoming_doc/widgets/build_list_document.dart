import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/document_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class BuildListIncomingDocument extends StatefulWidget {
  const BuildListIncomingDocument({Key? key}) : super(key: key);

  @override
  State<BuildListIncomingDocument> createState() =>
      _BuildListIncomingDocumentState();
}

class _BuildListIncomingDocumentState extends State<BuildListIncomingDocument> {
  late ListIncomingBloc listIncomingBloc;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listIncomingBloc = BlocProvider.of<ListIncomingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListIncomingBloc, ListIncomingState>(
        bloc: listIncomingBloc,
        listener: (context, state) {
          if (state is ListIncomingInitial) {
            currentPage = 0;
          }
        },
        builder: (context, state) {
          if (state is ListIncomingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ListIncomingSuccess) {
            return Column(
              children: listIncomingBloc.listIncomingDocument
                  .map((e) => Column(
                        children: [
                          DocumentTile(incomingDocument: e),
                          const SizedBox(
                            height: StyleConst.defaultPadding12,
                          )
                        ],
                      ))
                  .toList(),
            );
          }
          if (state is ListIncomingFetchMore) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...listIncomingBloc.listIncomingDocument.map((e) => Column(
                        children: [
                          DocumentTile(incomingDocument: e),
                          const SizedBox(
                            height: StyleConst.defaultPadding12,
                          )
                        ],
                      )),
                  const CircularProgressIndicator(),
                ]);
          }
          if (state is ListIncomingEmpty) {
            return Column(children: [
              ...listIncomingBloc.listIncomingDocument.map((e) => Column(
                    children: [
                      DocumentTile(incomingDocument: e),
                      const SizedBox(
                        height: StyleConst.defaultPadding12,
                      )
                    ],
                  )),
              Text("No data"),
            ]);
          }
          return Text("Xảy ra lỗi trong lúc lấy dữ liệu");
        });
  }
}
