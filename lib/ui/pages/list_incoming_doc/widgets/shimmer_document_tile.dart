import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingDocTile extends StatelessWidget {
  const ShimmerLoadingDocTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius15)),
      padding: const EdgeInsets.symmetric(
          horizontal: StyleConst.defaultPadding24,
          vertical: StyleConst.defaultPadding24 / 1.6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
