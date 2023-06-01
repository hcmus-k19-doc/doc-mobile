import 'package:flutter_app/model/outgoing_document.dart';

class PaginationOutgoingDocument {
  int? totalPages;

  PaginationOutgoingDocument(
      {this.totalPages, this.totalElements, this.listOutgoingDocument});

  int? totalElements;
  List<OutgoingDocument>? listOutgoingDocument;
}
