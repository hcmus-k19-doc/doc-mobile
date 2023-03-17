import 'package:flutter/material.dart';
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
          Text("${widget.incomingDocument.incomingNumber}"),
          Text("${widget.incomingDocument.originalSymbolNumber}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text("${widget.incomingDocument.documentType?.type}")),
              Flexible(child: Text("Còn 5 ngày"))
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
                children: [
                  Expanded(child: Text("Cấp gửi:")),
                  Flexible(
                      flex: 2,
                      child: Text(
                          "${widget.incomingDocument.sendingLevel?.level}"))
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Ngày đến:")),
                  Flexible(
                    flex: 2,
                    child: Text("${widget.incomingDocument.arrivingDate}"),
                  )
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Nơi phát hành:")),
                  Flexible(
                      flex: 2,
                      child: Text(
                          "${widget.incomingDocument.distributionOrg?.name}"))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Trình yếu")),
                  Flexible(
                    flex: 2,
                    child: Text("${widget.incomingDocument.summary}"),
                  )
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: Text("Toàn văn:")),
                  Flexible(flex: 2, child: Text(""))
                ],
              ),
              const SizedBox(
                height: StyleConst.defaultPadding / 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Trạng thái:")),
                  Flexible(
                      flex: 2, child: Text("${widget.incomingDocument.status}"))
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
                      children: const [
                        Text("Xem chi tiết"),
                        SizedBox(
                          width: StyleConst.defaultPadding / 2,
                        ),
                        Icon(Icons.arrow_circle_right_outlined)
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
