import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/list_incoming_doc/widgets/document_tile.dart';

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
                print("Show modal");
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
            DocumentTile(),
          ],
        ),
      ),
    );
  }
}
