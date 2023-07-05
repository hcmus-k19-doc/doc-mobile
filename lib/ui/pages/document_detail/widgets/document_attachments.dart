import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/router.dart';

class DocumentAttachment extends StatefulWidget {
  const DocumentAttachment({Key? key, required this.attachments})
      : super(key: key);
  final List<Attachment> attachments;

  @override
  State<DocumentAttachment> createState() => _DocumentAttachmentState();
}

class _DocumentAttachmentState extends State<DocumentAttachment> {
  bool _isExpanded = false;
  late bool _hasFiles;
  List<String> fileNames = [];
  List<String> pdfUrls = [];
  List<bool> isPdf = [];

  @override
  void initState() {
    super.initState();
    _hasFiles = widget.attachments.isNotEmpty;
    if (_hasFiles) {
      for (var element in widget.attachments) {
        fileNames.add(element.fileName ?? "Attachment");
        var url = "${UrlConst.DOC_FILE_URL}/${element.alfrescoFileId}";
        pdfUrls.add(url);
        if (element.fileType == "PDF") {
          isPdf.add(true);
        } else {
          isPdf.add(false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _hasFiles
        ? Container(
            padding: const EdgeInsets.all(StyleConst.defaultPadding16),
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
                    AppLocalizations.of(context)!.attachmentFile,
                    style: bodyLargeBold(context)
                        ?.copyWith(fontSize: 18, color: Colors.black),
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
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Image.asset(
                                        ImagesPath.pdfFile,
                                        height: 28,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      fileNames[index],
                                      style: bodyLarge(context),
                                    ))
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, MyRouter.pdfViewer,
                                    arguments: PdfViewerArguments(
                                        title: fileNames[index],
                                        url: pdfUrls[index],
                                        isPdf: isPdf[index]));
                              });
                        }),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
