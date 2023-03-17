import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class IncomingDocumentRepository extends BaseRepository {
  IncomingDocumentRepository(super.baseUrl);

  Future<List<IncomingDocument>> getIncomingDocumentList() async {
    try {
      final response =
          await provider.post(url: "/search", cancelToken: cancelToken);
      Iterable l = response["payload"];

      return List<IncomingDocument>.from(
          l.map((e) => IncomingDocument.fromJson(e)));
    } catch (err) {
      rethrow;
    }
  }
}
