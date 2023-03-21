import 'package:flutter_app/model/incoming_document.dart';

class PaginationIncomingDocument {
  int? totalPages;

  PaginationIncomingDocument(
      {this.totalPages, this.totalElements, this.listIncomingDocument});

  int? totalElements;
  List<IncomingDocument>? listIncomingDocument;
}
