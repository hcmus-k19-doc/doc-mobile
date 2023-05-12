import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:timelines/timelines.dart';

import '../../../../constants/export_constants.dart';

class DocumentProgressDetail extends StatefulWidget {
  const DocumentProgressDetail({Key? key, required this.processingDetail})
      : super(key: key);
  final List<ProcessingDetail> processingDetail;

  @override
  State<DocumentProgressDetail> createState() => _DocumentProgressDetailState();
}

class _DocumentProgressDetailState extends State<DocumentProgressDetail> {
  bool _isExpanded = false;
  final List<ProcessingDetail> test = [
    ProcessingDetail(
        step: 1,
        processingUser: ProcessingUser(
            fullName: "John Doe", department: "Phòng kế hoạch đầu tư")),
    // ProcessingDetail(
    //     step: 2,
    //     processingUser: ProcessingUser(fullName: "A", department: "Phong KD")),
  ];
  final List<String> upcomingProcess = [
    "Văn thư",
    "Trưởng phòng",
    "Chuyên viên"
  ];

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
                      itemCount: test.length,
                      // itemCount: widget.processingDetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      test[index].processingUser?.fullName ??
                                          "",
                                      style: bodyLargeBold(context)),
                                  Text(
                                      test[index].processingUser?.department ??
                                          "",
                                      style: bodyLarge(context)),
                                ],
                              ),
                              // child: Text(widget.processingDetail[index].processingUser?.fullName??""),
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
                      itemCount: upcomingProcess.length - test.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            contents: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(upcomingProcess[index + test.length],
                                  style: bodyLarge(context)),
                              // child: Text(widget.processingDetail[index].processingUser?.fullName??""),
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
