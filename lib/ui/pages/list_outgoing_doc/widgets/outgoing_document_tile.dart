import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/custome_outgoing_doc.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

import '../../../../constants/color_const.dart';

class OutgoingDocumentTile extends StatefulWidget {
  const OutgoingDocumentTile({Key? key, required this.outgoingDocument})
      : super(key: key);
  final CustomOutgoingDoc outgoingDocument;

  @override
  State<OutgoingDocumentTile> createState() => _OutgoingDocumentTileState();
}

class _OutgoingDocumentTileState extends State<OutgoingDocumentTile> {
  bool _isExpanded = false;
  DateFormat outputFormat = DateFormat('dd-MM-yyyy');

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
                "${AppLocalizations.of(context)!.originalSymbolNumber}: ${widget.outgoingDocument.originalSymbolNumber ?? ""}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded
                        ? ColorConst.primaryBlue
                        : DefaultColor(context).fontColor),
              ),
              Text(
                widget.outgoingDocument.documentTypeName ?? "",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded
                        ? ColorConst.primaryBlue
                        : DefaultColor(context).fontColor),
              ),
              Text(
                "${AppLocalizations.of(context)!.releaseNumber}: ${widget.outgoingDocument.outgoingNumber ?? ""}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded
                        ? ColorConst.primaryBlue
                        : DefaultColor(context).fontColor),
              ),
              // Text(
              //   "Còn 5 ngày",
              //   style: bodyLarge(context)?.copyWith(
              //       color: _isExpanded ? ColorConst.primaryBlueAccent : Colors.black),
              // )
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
                      "${AppLocalizations.of(context)!.arrivingDate}:",
                      style: bodyLarge(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.createdDate != null
                            ? outputFormat.format(DateTime.parse(
                                widget.outgoingDocument.createdDate!))
                            : "",
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
                      "${AppLocalizations.of(context)!.issuePlace}:",
                      style: bodyLarge(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.publishingDepartmentName ??
                              "",
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
                      "${AppLocalizations.of(context)!.summary}:",
                      style: bodyLarge(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: HtmlWidget(
                        widget.outgoingDocument.summary ?? "",
                        textStyle: bodyLarge(context),
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
                      "${AppLocalizations.of(context)!.status}:",
                      style: bodyLarge(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
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
                        Navigator.of(context).pushNamed(
                            MyRouter.outgoingDocumentDetail,
                            arguments: DocumentDetailArgs(
                                documentId: widget.outgoingDocument.id ?? -1));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
                            AppLocalizations.of(context)!.seeDetail,
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
