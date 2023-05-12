import 'package:flutter_app/repositories/base_repository.dart';

class CommentRepository extends BaseRepository {
  CommentRepository(super.baseUrl);

  Future<List<String>> getIncomingDocumentCommentsById(int id) async {
    try {
      final response = await provider.get(
          url: "/incoming-documents/$id", cancelToken: cancelToken);

      // return IncomingDocument.fromJson(response);
      return ["Comments 1", "Comments 2"];
    } catch (err) {
      rethrow;
    }
  }
}
