import 'package:flutter_app/model/distrbution_org.dart';
import 'package:flutter_app/model/document_type.dart';
import 'package:flutter_app/model/incoming_document.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class SuggestionRepository extends BaseRepository {
  SuggestionRepository(super.baseUrl);

  Future<List<DocumentType>> getDocumentTypesList() async {
    try {
      final response = await provider.get(
        url: "/document-types",
        cancelToken: cancelToken,
      );
      Iterable l = response;
      return List<DocumentType>.from(l.map((e) => DocumentType.fromJson(e)));
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<DistributionOrg>> getDistributionOrgList() async {
    try {
      final response = await provider.get(
        url: "/distribution-organizations",
        cancelToken: cancelToken,
      );
      Iterable l = response;

      return List<DistributionOrg>.from(
          l.map((e) => DistributionOrg.fromJson(e)));
    } catch (err) {
      rethrow;
    }
  }
}
