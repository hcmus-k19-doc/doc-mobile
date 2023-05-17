import 'package:flutter_app/model/comment_detail.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class CommentRepository extends BaseRepository {
  CommentRepository(super.baseUrl);

  Future<List<Comment>> getCommentsById(int id) async {
    try {
      final response = await provider.get(
          url: "/incoming-documents/$id", cancelToken: cancelToken);

      return  List<Comment>.from(response.map((e) => Comment.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<String> postComment(int id, String comment) async {
    try {
      final response = await provider.post(
          url: "/incoming-documents/$id",
          data: {
            "content": comment
          },
          cancelToken: cancelToken);

      return response.toString();
    } catch (err) {
      rethrow;
    }
  }
}
