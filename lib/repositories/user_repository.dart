import 'package:flutter_app/model/profile.dart';
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
}
