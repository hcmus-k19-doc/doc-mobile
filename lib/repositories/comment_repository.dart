import 'package:flutter_app/model/comment_detail.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class CommentRepository extends BaseRepository {
  CommentRepository(super.baseUrl);

  Future<List<Comment>> getIncomingDocumentCommentsById(int id) async {
    try {
      final response = await provider.get(
          url: "/incoming-documents/$id", cancelToken: cancelToken);

      return  List<Comment>.from(response.map((e) => Comment.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }
}
