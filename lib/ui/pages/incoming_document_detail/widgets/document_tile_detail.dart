import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';

class DocumentTileDetail extends StatefulWidget {
  const DocumentTileDetail({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentTileDetail> createState() => _DocumentTileDetailState();
}

class _DocumentTileDetailState extends State<DocumentTileDetail> {
  bool _isExpanded = false;
  Map<String, String> convertLevel = {
    'LOW':'Thấp',
    'MEDIUM':'Trung bình',
    'HIGH':'Cao',
  };
  Map<String, String> convertSendingLevel = {
    'CITY':'Thành phố',
    'DISTRICT':'Quận',
    'SCHOOL':'Trường',
  };

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
            "Thông tin văn bản",
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          "Loại văn bản:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${widget.incomingDocument.documentType?.type}",
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
                        "${widget.incomingDocument.arrivingDate}",
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
                          "Ngày phát hành:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${widget.incomingDocument.distributionDate}",
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
                          "Cấp gửi:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${convertSendingLevel[widget.incomingDocument.sendingLevel?.level]}",
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          "Hồ sơ công việc:",
                          style: bodyLarge(context),
                        )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "${widget.incomingDocument.folder?.folderName}",
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
                          "Độ mật:",
                          style: bodyLarge(context),
                        )),
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
                          "Độ khẩn:",
                          style: bodyLarge(context),
                        )),
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
                      "Trạng thái:",
                      style: bodyLarge(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          "${widget.incomingDocument.status}",
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
