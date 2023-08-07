import 'package:flutter_app/model/comment_detail.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class CommentRepository extends BaseRepository {
  CommentRepository(super.baseUrl);

  Future<List<Comment>> getCommentsById(int id, bool isOutgoing) async {
    try {
      final response = await provider.get(
          url: "/${isOutgoing ? "OUTGOING_DOCUMENT" : "INCOMING_DOCUMENT"}/$id",
          cancelToken: cancelToken);

      return List<Comment>.from(
          response["payload"].map((e) => Comment.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<String> postComment(int id, String comment, bool isOutgoing) async {
    try {
      final response = await provider.post(
          url: "/$id",
          data: {
            "content": comment,
            "processingDocumentType":
                isOutgoing ? "OUTGOING_DOCUMENT" : "INCOMING_DOCUMENT"
          },
          cancelToken: cancelToken);

      return response.toString();
    } catch (err) {
      rethrow;
    }
  }
}
