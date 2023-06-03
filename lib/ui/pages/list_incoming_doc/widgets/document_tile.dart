import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DocumentTile extends StatefulWidget {
  const DocumentTile({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  bool _isExpanded = false;
  DateFormat inputFormat = DateFormat('yyyy-MM-dd');
  DateFormat outputFormat = DateFormat('dd-MM-yyyy');

  String reformatDate(String? originalDate) {
    DateTime date = inputFormat.parse(originalDate!);
    return outputFormat.format(date);
  }

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
                "Số ký hiệu gốc: ${widget.incomingDocument.originalSymbolNumber}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              ),
              Text(
                "${widget.incomingDocument.documentType?.type}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              ),
              Text(
                "Thời hạn xử lý: ${widget.incomingDocument.processingDuration ?? "01-01-1970"}",
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
                      "Ngày đến:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        reformatDate(widget.incomingDocument.arrivingDate),
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
                          "${widget.incomingDocument.distributionOrg?.name}",
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
                        "${widget.incomingDocument.summary}",
                        style: bodyLarge(context),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding12,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //         child: Text("Toàn văn:", style: bodyLarge(context))),
                //     Flexible(
                //         flex: 2,
                //         child: Text(
                //           "",
                //           style: bodyLarge(context),
                //         ))
                //   ],
                // ),
                // const SizedBox(
                //   height: StyleConst.defaultPadding12,
                // ),
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
                              "${widget.incomingDocument.status}"),
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
                        Navigator.of(context).pushNamed(
                            MyRouter.incomingDocumentDetail,
                            arguments: DocumentDetailArgs(
                                documentId: widget.incomingDocument.id ?? -1));
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
