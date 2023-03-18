import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class IncomingDocumentRepository extends BaseRepository {
  IncomingDocumentRepository(super.baseUrl);

  Future<List<IncomingDocument>> getIncomingDocumentList(
      SearchCriteria? searchCriteria) async {
    try {
      final response = await provider.post(
          url: "/search",
          cancelToken: cancelToken,
          data: searchCriteria?.toMap());
      Iterable l = response["payload"];

      return List<IncomingDocument>.from(
          l.map((e) => IncomingDocument.fromJson(e)));
    } catch (err) {
      rethrow;
    }
  }
}
