import 'package:flutter/material.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:timelines/timelines.dart';

import '../../../../constants/export_constants.dart';

class DocumentProgressDetail extends StatefulWidget {
  const DocumentProgressDetail(
      {Key? key, required this.processingDetail, required this.isOutgoing})
      : super(key: key);
  final List<ProcessingDetail> processingDetail;
  final bool isOutgoing;

  @override
  State<DocumentProgressDetail> createState() => _DocumentProgressDetailState();
}

class _DocumentProgressDetailState extends State<DocumentProgressDetail> {
  bool _isExpanded = false;
  List<String> upcomingProcess = [];

  @override
  void initState() {
    super.initState();
    if (widget.isOutgoing) {
      upcomingProcess = DisplayMap.outgoingProcess;
    } else {
      upcomingProcess = DisplayMap.incomingProcess;
    }
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
            "Thông tin luân chuyển",
            style: bodyLargeBold(context)?.copyWith(
                fontSize: 18, color: _isExpanded ? Colors.black : Colors.black),
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
              padding: const EdgeInsets.all(StyleConst.defaultPadding24),
              child: Column(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.processingDetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        widget.processingDetail[index]
                                                .processingUser?.roleTitle ??
                                            upcomingProcess[index],
                                        style: bodyLargeBold(context)
                                            ?.copyWith(fontSize: 16)),
                                    Text(
                                        "${widget.processingDetail[index].processingUser?.fullName} - ${widget.processingDetail[index].processingUser?.department}",
                                        style: bodyLarge(context)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          node: const TimelineNode(
                            indicator: DotIndicator(),
                            startConnector: SolidLineConnector(),
                            endConnector: SolidLineConnector(),
                          ),
                        );
                      }),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: (upcomingProcess.length -
                                  widget.processingDetail.length >
                              0)
                          ? upcomingProcess.length -
                              widget.processingDetail.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            contents: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                  upcomingProcess[
                                      index + widget.processingDetail.length],
                                  style: bodyLarge(context)),
                            ),
                            node: const TimelineNode(
                              indicator: DotIndicator(color: Colors.grey),
                              startConnector:
                                  SolidLineConnector(color: Colors.grey),
                              endConnector:
                                  SolidLineConnector(color: Colors.grey),
                            ),
                          ),
                        );
                      })
                ],
              )),
        ],
      ),
    );
  }
}
