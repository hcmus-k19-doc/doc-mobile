import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/pagination_coming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class IncomingDocumentRepository extends BaseRepository {
  IncomingDocumentRepository(super.baseUrl);

  Future<PaginationIncomingDocument> getPaginationIncomingDocumentList(
      SearchCriteria? searchCriteria) async {
    try {
      final response = await provider.post(
          url: "/search",
          cancelToken: cancelToken,
          data: searchCriteria?.toMap());

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
}
