import 'package:flutter/material.dart';
import 'package:flutter_app/constants/color_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: StyleConst.defaultPadding12,
            ),
            const Icon(Icons.arrow_downward),
            const SizedBox(
              width: StyleConst.defaultPadding12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Chuyền xử lý",
                  style: bodyLarge(context),
                ),
                SizedBox(
                  height: StyleConst.defaultPadding4,
                ),
                Text(
                  "Sankar đã chuyển văn bản số .. cho bạn",
                  style: bodyLarge(context)?.copyWith(color: ColorConst.grey),
                ),
              ],
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
