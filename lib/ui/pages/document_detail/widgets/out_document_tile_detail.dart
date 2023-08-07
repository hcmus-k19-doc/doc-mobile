import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class OutDocumentTileDetail extends StatefulWidget {
  const OutDocumentTileDetail({Key? key, required this.outgoingDocument})
      : super(key: key);
  final OutgoingDocument outgoingDocument;

  @override
  State<OutDocumentTileDetail> createState() => _OutDocumentTileDetailState();
}

class _OutDocumentTileDetailState extends State<OutDocumentTileDetail> {
  bool _isExpanded = false;
  Map<String, String> convertLevel = DisplayMap.urgencyLevel;

  Map<String, String> convertSendingLevel = DisplayMap.sendingLevel;

  Map<String, String> statusLevel = DisplayMap.statusLevel;

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
            AppLocalizations.of(context)!.docInfo,
            style: bodyLargeBold(context)?.copyWith(fontSize: 18),
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
              endIndent: StyleConst.defaultPadding16),
          Padding(
            padding: const EdgeInsets.all(StyleConst.defaultPadding16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      "${AppLocalizations.of(context)!.numWithFolder}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.outgoingNumber ??
                              AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.originalSymbolNumber}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.originalSymbolNumber ??
                              AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.searchCriteriaBar("document_type")}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.documentType?.type ??
                              AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.arrivingDate}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.createdDate ??
                            AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.issueDate}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.releaseDate ??
                            AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.issueUnit}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.publishingDepartment
                                  ?.departmentName ??
                              AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.receiveUnit}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.recipient ??
                              AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.signer}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.signer ??
                              AppLocalizations.of(context)!.unKnown,
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
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: HtmlWidget(
                        widget.outgoingDocument.summary ??
                            AppLocalizations.of(context)!.unKnown,
                        textStyle: bodyLarge(context),
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
                      "${AppLocalizations.of(context)!.folderDoc}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.folder?.folderName ??
                            AppLocalizations.of(context)!.unKnown,
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
                      "${AppLocalizations.of(context)!.secretLevel}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${convertLevel[widget.outgoingDocument.confidentiality]}",
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
                      "${AppLocalizations.of(context)!.emergencyLevel}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${convertLevel[widget.outgoingDocument.urgency]}",
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
                      "${AppLocalizations.of(context)!.status}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          statusLevel[widget.outgoingDocument.status] ??
                              AppLocalizations.of(context)!.unKnown,
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
