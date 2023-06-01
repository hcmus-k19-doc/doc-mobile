import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/outgoing_document.dart';

class OutDocumentTileDetail extends StatefulWidget {
  const OutDocumentTileDetail({Key? key, required this.outgoingDocument})
      : super(key: key);
  final OutgoingDocument outgoingDocument;

  @override
  State<OutDocumentTileDetail> createState() => _OutDocumentTileDetailState();
}

class _OutDocumentTileDetailState extends State<OutDocumentTileDetail> {
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

  Map<String, String> statusLevel = {
    'IN_PROGRESS': 'Đang xử lý',
    'RELEASED': 'Đã phát hành',
    'UNPROCESSED':'Chưa xử lý'
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
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.outgoingNumber??"Không xác định",
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
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.originalSymbolNumber??"Không xác định",
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
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.documentType?.type??"Không xác định",
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
                      style: bodyLargeBold(context),
                    )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.createdDate??"Không xác định",
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
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.releaseDate??"Không xác định",
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
                          "Đơn vị phát hành:",
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.publishingDepartment?.departmentName??"Không xác định",
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
                          "Đơn vị nhận:",
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.recipient??"Không xác định",
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
                      "Người ký:",
                      style: bodyLargeBold(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          widget.outgoingDocument.signer??"Không xác định",
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
                      style: bodyLargeBold(context),
                    )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.summary??"Không xác định",
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
                          style: bodyLargeBold(context),
                        )),
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.outgoingDocument.folder?.folderName??"Không xác định",
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
                          style: bodyLargeBold(context),
                        )),
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
                          "Độ khẩn:",
                          style: bodyLargeBold(context),
                        )),
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
                      "Trạng thái:",
                      style: bodyLargeBold(context),
                    )),
                    Flexible(
                        flex: 2,
                        child: Text(
                          statusLevel[widget.outgoingDocument.status]??"Không xác định",
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
