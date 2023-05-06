import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';

class DocumentAttachment extends StatefulWidget {
  const DocumentAttachment({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentAttachment> createState() => _DocumentAttachmentState();
}

class _DocumentAttachmentState extends State<DocumentAttachment> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius15)),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding4),
          child: Text(
            "Tệp đính kèm",
            style: bodyLargeBold(context)?.copyWith(fontSize: 18,
                color: Colors.black),
          ),
        ),
        trailing: AnimatedRotation(
            turns: _isExpanded ? .5 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.keyboard_arrow_down_sharp)),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: [
          const Divider(
            thickness: 1,
            height: 1,
            indent: StyleConst.defaultPadding16,
            endIndent: StyleConst.defaultPadding16
          ),
          Padding(
            padding: const EdgeInsets.all(StyleConst.defaultPadding16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          "Số theo sổ VB:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${widget.incomingDocument.incomingNumber}",
                          style: bodyLarge(context),
                        ))
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          "Số ký hiệu gốc:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${widget.incomingDocument.originalSymbolNumber}",
                          style: bodyLarge(context),
                        ))
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
