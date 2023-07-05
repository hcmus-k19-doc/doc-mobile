import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer(
      {super.key, required this.title, required this.url, required this.isPdf});

  final String title;
  final String url;
  final bool isPdf;

  @override
  PdfViewerState createState() => PdfViewerState();
}

class PdfViewerState extends State<PdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          if (widget.isPdf)
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
        ],
      ),
      body: widget.isPdf
          ? SfPdfViewer.network(
              widget.url,
              key: _pdfViewerKey,
            )
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.url,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) {
                    print(error);
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
    );
  }
}
