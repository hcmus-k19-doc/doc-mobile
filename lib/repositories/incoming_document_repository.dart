import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/processing_detail.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class IncomingDocumentRepository extends BaseRepository {
  IncomingDocumentRepository(super.baseUrl);

  Future<PaginationIncomingDocument> fetchPaginationIncomingDocumentList(
      SearchCriteria? searchCriteria, int page) async {
    try {
      final response = await provider.post(
          url: "/search",
          cancelToken: cancelToken,
          data: searchCriteria?.toMap(),
          queryParams: {"page": page});

      PaginationIncomingDocument tempPagination = PaginationIncomingDocument();
      Iterable l = response["payload"];

      tempPagination.totalPages = response["totalPages"];
      tempPagination.totalElements = response["totalElements"];
      tempPagination.listIncomingDocument = List<IncomingDocument>.from(
          l.map((e) => IncomingDocument.fromJson(e))).toList();
      return tempPagination;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<IncomingDocument>> getDocumentOnPage(
      int page, SearchCriteria? searchCriteria) async {
    try {
      final response = await provider.post(
          url: "/search",
          cancelToken: cancelToken,
          queryParams: {"page": page},
          data: searchCriteria?.toMap());

      Iterable l = response["payload"];

      return List<IncomingDocument>.from(
          l.map((e) => IncomingDocument.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<IncomingDocument> getIncomingDocumentDetailById(
      int id) async {
    try {
      final response = await provider.get(
          url: "/$id",
          cancelToken: cancelToken);

      return IncomingDocument.fromJson(response);
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
}
