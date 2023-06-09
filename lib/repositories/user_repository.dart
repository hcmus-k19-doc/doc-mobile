import 'package:dio/dio.dart';
import 'package:flutter_app/model/profile.dart';
import 'package:flutter_app/model/transfer_history.dart';
import 'package:flutter_app/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.baseUrl);

  Future<Profile> getCurrentProfile() async {
    try {
      var response = await provider.get(url: "/current");
      return Profile.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> changePasswordCurrentUser(
      String newPassword, String oldPassword) async {
    try {
      await provider.put(
          url: "/current/password",
          contentType: Headers.formUrlEncodedContentType,
          data: {"newPassword": newPassword, "oldPassword": oldPassword});
    } catch (error) {
      rethrow;
    }
  }

  Future<List<TransferHistory>> fetchTransferHistoryList(
      int page, int userId, int pageSize) async {
    try {
      final response = await provider.post(
          url: "/get-transfer-history",
          cancelToken: cancelToken,
          data: {"userId": userId},
          queryParams: {"page": page, "pageSize": pageSize});
      Iterable l = response;
      return List<TransferHistory>.from(
          l.map((e) => TransferHistory.fromJson(e)));
    } catch (err) {
      rethrow;
    }
  }
}
