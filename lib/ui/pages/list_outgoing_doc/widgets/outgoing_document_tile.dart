import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutgoingDocumentTile extends StatefulWidget {
  const OutgoingDocumentTile({Key? key, required this.outgoingDocument})
      : super(key: key);
  final OutgoingDocument outgoingDocument;

  @override
  State<OutgoingDocumentTile> createState() => _OutgoingDocumentTileState();
}

class _OutgoingDocumentTileState extends State<OutgoingDocumentTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius15)),
      child: ExpansionTile(
        title: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Số ký hiệu gốc: ${widget.outgoingDocument.originalSymbolNumber}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              ),
              Text(
                "${widget.outgoingDocument.documentType?.type}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              ),
              Text(
                "Còn 5 ngày",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              )
            ],
          ),
        ),
        trailing: Column(
          children: [
            AnimatedRotation(
                turns: _isExpanded ? .5 : 0,
                duration: const Duration(milliseconds: 300),
                child: const Icon(Icons.keyboard_arrow_down_sharp))
          ],
        ),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: [
          const Divider(
            thickness: 1,
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
                      "Cấp gửi:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          AppLocalizations.of(context)!.sendingLevel(
                              "${widget.outgoingDocument.recipient}"),
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
                      "Ngày đến:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${widget.outgoingDocument.createdBy}",
                        style: bodyLarge(context),
                      ),
                    )
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
                      "Nơi phát hành:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${widget.outgoingDocument.publishingDepartment?.departmentName}",
                          style: bodyLarge(context),
                        ))
                  ],
                ),
                const SizedBox(height: StyleConst.defaultPadding12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      "Trích yếu",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${widget.outgoingDocument.summary}",
                        style: bodyLarge(context),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text("Toàn văn:", style: bodyLarge(context))),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "",
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
                      "Trạng thái:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          AppLocalizations.of(context)!.processingStatus(
                              "${widget.outgoingDocument.status}"),
                          style: bodyLarge(context),
                        ))
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Navigate to outgoing doc");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              StyleConst.defaultRadius15), // <-- Radius
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                StyleConst.defaultPadding12), // and this
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Xem chi tiết",
                            style: bodyLarge(context)
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}