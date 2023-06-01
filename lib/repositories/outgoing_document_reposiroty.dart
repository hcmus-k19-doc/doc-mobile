import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/pagination_outgoing_document.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class OutgoingDocumentRepository extends BaseRepository {
  OutgoingDocumentRepository(super.baseUrl);

  Future<PaginationOutgoingDocument> fetchPaginationOutgoingDocumentList(
      OutgoingSearchCriteria? outgoingSearchCriteria, int page) async {
    try {
      final response = await provider.post(
          url: "/search",
          cancelToken: cancelToken,
          data: outgoingSearchCriteria?.toMap(),
          queryParams: {"page": page});

      PaginationOutgoingDocument tempPagination = PaginationOutgoingDocument();
      Iterable l = response["payload"];

      tempPagination.totalPages = response["totalPages"];
      tempPagination.totalElements = response["totalElements"];
      tempPagination.listOutgoingDocument = List<OutgoingDocument>.from(
          l.map((e) => OutgoingDocument.fromJson(e))).toList();
      return tempPagination;
    } catch (err) {
      rethrow;
    }
  }
}
