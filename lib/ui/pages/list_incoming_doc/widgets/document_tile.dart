import 'package:flutter/material.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';

class DocumentTile extends StatefulWidget {
  const DocumentTile({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
          side: const BorderSide(color: Colors.black, width: 0.5)),
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
          side: const BorderSide(color: Colors.black, width: 0.5)),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("${widget.incomingDocument.id}.")],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.incomingDocument.incomingNumber}",
            style: bodyLarge(context)?.copyWith(
                color: _isExpanded ? Colors.blueAccent : Colors.black),
          ),
          Text(
            "${widget.incomingDocument.originalSymbolNumber}",
            style: bodyLarge(context)?.copyWith(
                color: _isExpanded ? Colors.blueAccent : Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "${widget.incomingDocument.documentType?.type}",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              )),
              Flexible(
                  child: Text(
                "Còn 5 ngày",
                style: bodyLarge(context)?.copyWith(
                    color: _isExpanded ? Colors.blueAccent : Colors.black),
              ))
            ],
          )
        ],
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
          padding: const EdgeInsets.all(StyleConst.defaultPadding),
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
                        "${widget.incomingDocument.sendingLevel?.level}",
                        style: bodyLarge(context),
                      ))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
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
                height: StyleConst.defaultPadding / 2,
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
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
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
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Toàn văn:", style: bodyLarge(context))),
                  Flexible(
                      flex: 2,
                      child: Text(
                        "",
                        style: bodyLarge(context),
                      ))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
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
                height: StyleConst.defaultPadding / 2,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            StyleConst.defaultRadius), // <-- Radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              StyleConst.defaultPadding / 2), // and this
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Xem chi tiết",
                          style:
                              bodyLarge(context)?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: StyleConst.defaultPadding / 2,
                        ),
                        const Icon(Icons.arrow_circle_right_outlined)
                      ],
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
