import 'package:flutter/material.dart';

import '../../../../constants/font_const.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.title, required this.callback});
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
            style: bodyLarge(context),
          ),
          onTap: callback,
          contentPadding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
