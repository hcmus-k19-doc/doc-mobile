import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:timelines/timelines.dart';

import '../../../../constants/export_constants.dart';
import '../../../common_widgets/elevated_button.dart';

class DocumentProgressDetail extends StatefulWidget {
  const DocumentProgressDetail({Key? key, required this.processingDetail})
      : super(key: key);
  final List<ProcessingDetail> processingDetail;

  @override
  State<DocumentProgressDetail> createState() => _DocumentProgressDetailState();
}

class _DocumentProgressDetailState extends State<DocumentProgressDetail> {
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
            "Thông tin luân chuyển",
            style: bodyLargeBold(context)?.copyWith(fontSize: 18,
                color: _isExpanded ? Colors.black : Colors.black),
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
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.processingDetail.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 80.0,
                            child: TimelineNode(
                              indicator: Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.processingDetail[index].processingUser?.fullName??""),
                                ),
                              ),
                              startConnector: const SolidLineConnector(),
                              endConnector: const SolidLineConnector(),
                            ),
                          )
                        ],
                      );
                    }),
                if(widget.processingDetail.isEmpty)
                  SizedBox(
                    height: 80.0,
                    child: TimelineNode(
                      indicator: Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Van thu"),
                        ),
                      ),
                      startConnector: const SolidLineConnector(),
                      endConnector: const SolidLineConnector(),
                    ),
                  )
              ],
            )

            ),
        ],
      ),
    );
  }
}
