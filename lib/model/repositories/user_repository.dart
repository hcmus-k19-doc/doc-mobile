import 'package:dio/dio.dart';
import '../../utils/local_preferences.dart';

class UserRepository {
  static const String userPrefix = "user/";
  LocalPreferences localPreferences;
  final dio = Dio();

  UserRepository({required this.localPreferences});

  Future<String> getAccessToken() async {
    var accessToken = await localPreferences.getString(DATA_CONST.ACCESS_TOKEN);
    return accessToken;
  }

  Future<String> getSession() async {
    var session = await localPreferences.getString(DATA_CONST.SESSION);
    return session;
  }

  Future<String> getVersionApp() async {
    var versionApp = await localPreferences.getString(DATA_CONST.VERSION_APP);
    return versionApp;
  }

  Future<bool> cacheSession(String session) {
    return localPreferences.saveString(DATA_CONST.SESSION, session);
  }

  Future<bool> cacheVersionApp(String value) {
    return localPreferences.saveString(DATA_CONST.VERSION_APP, value);
  }

  Future<bool> logout() async {
    return await localPreferences.logout();
  }
}
