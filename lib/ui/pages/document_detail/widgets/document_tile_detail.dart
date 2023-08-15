import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class DocumentTileDetail extends StatefulWidget {
  const DocumentTileDetail({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentTileDetail> createState() => _DocumentTileDetailState();
}

class _DocumentTileDetailState extends State<DocumentTileDetail> {
  bool _isExpanded = false;
  Map<String, String> convertLevel = DisplayMap.urgencyLevel;

  Map<String, String> convertSendingLevel = DisplayMap.sendingLevel;

  Map<String, String> statusLevel = DisplayMap.statusLevel;

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
                          widget.incomingDocument.incomingNumber ??
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
                          widget.incomingDocument.originalSymbolNumber ??
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
                          widget.incomingDocument.documentType?.type ??
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
                      "${AppLocalizations.of(context)!.issueDate}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        reformatDate(widget.incomingDocument.distributionDate),
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
                //         child: Text(
                //       "${AppLocalizations.of(context)!.sendingLevelString}:",
                //       style: bodyLargeBold(context),
                //     )),
                //     Flexible(
                //         flex: 2,
                //         child: Text(
                //           "${convertSendingLevel[widget.incomingDocument.sendingLevel?.level]}",
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
                      "${AppLocalizations.of(context)!.issuePlace}:",
                      style: bodyLargeBold(context),
                    )),
                    const SizedBox(
                      width: StyleConst.defaultPadding8,
                    ),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.incomingDocument.distributionOrg?.name ??
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
                        widget.incomingDocument.summary ?? "",
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
                        widget.incomingDocument.folder?.folderName ??
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
                        "${convertLevel[widget.incomingDocument.confidentiality]}",
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
                        "${convertLevel[widget.incomingDocument.urgency]}",
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
                          statusLevel[widget.incomingDocument.status] ??
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
