import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/outgoing_document.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/pagination_outgoing_document.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class OutgoingDocumentRepository extends BaseRepository {
  OutgoingDocumentRepository(super.baseUrl);

  Future<OutgoingDocument> getOutgoingDocumentDetailById(
      int id) async {
    try {
      final response = await provider.get(
          url: "/$id",
          cancelToken: cancelToken);

      return OutgoingDocument.fromJson(response);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<ProcessingDetail>> getIncomingDocumentProcessByI(
      int id) async {
    try {
      final response = await provider.get(
          url: "/$id/processing-details?onlyAssignee=true",
          cancelToken: cancelToken);

      return List<ProcessingDetail>.from(response.map((e) => ProcessingDetail.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }

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
