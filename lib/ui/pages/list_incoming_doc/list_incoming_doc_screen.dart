import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/document_tile.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/seach_modal.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/shimmer_document_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListIncomingDocScreen extends StatefulWidget {
  const ListIncomingDocScreen({Key? key}) : super(key: key);

  @override
  State<ListIncomingDocScreen> createState() => _ListIncomingDocScreenState();
}

class _ListIncomingDocScreenState extends State<ListIncomingDocScreen> {
  int numUnHandle = 0;
  int numCoopHandle = 1;
  int numExpired = 3;

  List testDocumentTile = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    ListIncomingBloc listIncomingBloc =
        BlocProvider.of<ListIncomingBloc>(context);
    listIncomingBloc.add(FetchIncomingListDocumentEvent());
    return BlocBuilder<ListIncomingBloc, ListIncomingState>(
      bloc: listIncomingBloc,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hiện tại bạn có:",
                  style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: StyleConst.defaultPadding,
                      top: StyleConst.defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$numUnHandle văn bản chưa xử lý",
                        style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 18),
                      ),
                      Text(
                        "$numCoopHandle văn bản cần phối hợp thực hiện",
                        style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 18),
                      ),
                      Text(
                        "$numExpired văn bản quá hạn",
                        style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding,
                ),
                Text(
                  "Danh sách văn bản đến",
                  style: FontConst.REGULAR_BLACK2.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding / 2,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top:
                                    Radius.circular(StyleConst.defaultRadius))),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SearchModal();
                        });
                  },
                  splashFactory: NoSplash.splashFactory,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list_alt,
                        color: Colors.grey[700],
                        size: 20,
                      ),
                      Text(
                        "TIÊU THỨC TÌM KIẾM",
                        style: FontConst.MEDIUM_BLACK2.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding / 2,
                ),
                
                if (state is ListIncomingLoading)
                  Column(
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
                  )
                else if (state is ListIncomingSuccess)
                  Column(
                    children: state.listDocs
                        .map((e) => Column(
                              children: [
                                DocumentTile(
                                  incomingDocument: e,
                                ),
                                const SizedBox(
                                  height: StyleConst.defaultPadding,
                                )
                              ],
                            ))
                        .toList(),
                  )
                else
                  Text("Fail to get list document")
              ],
            ),
          ),
        );
      },
    );
  }
}
