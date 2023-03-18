import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/build_list_document.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/seach_modal.dart';
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

  @override
  Widget build(BuildContext context) {
    ListIncomingBloc listIncomingBloc =
        BlocProvider.of<ListIncomingBloc>(context);
    listIncomingBloc.add(FetchIncomingListDocumentEvent());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hiện tại bạn có:",
              style: bodyLarge(context)?.copyWith(fontSize: 20),
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
                    style: bodyLarge(context)?.copyWith(fontSize: 18),
                  ),
                  Text(
                    "$numCoopHandle văn bản cần phối hợp thực hiện",
                    style: bodyLarge(context)?.copyWith(fontSize: 18),
                  ),
                  Text(
                    "$numExpired văn bản quá hạn",
                    style: bodyLarge(context)?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding,
            ),
            Text(
              "Danh sách văn bản đến",
              style: bodyLarge(context)?.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding / 2,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(StyleConst.defaultRadius))),
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
                    style: bodyLargeBold(context)?.copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: StyleConst.defaultPadding / 2,
            ),
            const BuildListIncomingDocument(),
          ],
        ),
      ),
    );
  }
}
