import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';

import '../../../../app/router.dart';

class DocumentAttachment extends StatefulWidget {
  const DocumentAttachment({Key? key, required this.incomingDocument})
      : super(key: key);
  final IncomingDocument incomingDocument;

  @override
  State<DocumentAttachment> createState() => _DocumentAttachmentState();
}

class _DocumentAttachmentState extends State<DocumentAttachment> {
  bool _isExpanded = false;
  late bool _hasFiles;
  late List<String> pdfUrls;

  @override
  void initState() {
    super.initState();
    // _hasFiles = widget.incomingDocument.attachments?.isNotEmpty ?? false;
    _hasFiles = true;
    pdfUrls = [
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
      "https://cdn.syncfusion.com/content/PDFViewer/encrypted.pdf"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _hasFiles
        ? Container(
      padding:  const EdgeInsets.all(StyleConst.defaultPadding16),
          child: Card(
              elevation: 3,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(StyleConst.defaultRadius15)),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Padding(
                  padding: const EdgeInsets.all(StyleConst.defaultPadding4),
                  child: Text(
                    "Tệp đính kèm",
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
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: pdfUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Image.asset(
                                      ImagesPath.pdfFile,
                                      height: 28,
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Filename.pdf",
                                    style: bodyLarge(context),
                                  ))
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, MyRouter.pdfViewer,
                                  arguments: PdfViewerArguments(
                                      title:
                                      "No title",
                                      pdfUrl: pdfUrls[index]));
                            }
                          );
                        }),
                  )
                ],
              ),
            ),
        )
        : const SizedBox();
  }
}
