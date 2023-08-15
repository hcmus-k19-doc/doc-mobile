import 'package:flutter_app/model/custome_outgoing_doc.dart';

class PaginationOutgoingDocument {
  int? totalPages;

  PaginationOutgoingDocument(
      {this.totalPages, this.totalElements, this.listOutgoingDocument});

  int? totalElements;
  List<CustomOutgoingDoc>? listOutgoingDocument;
}
