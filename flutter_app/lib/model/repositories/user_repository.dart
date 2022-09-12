import 'package:dio/dio.dart';
import '../../utils/local_preferences.dart';

class UserRepository {
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

  Future<String> getKeyActive() async {
    var keyActive = await localPreferences.getString(DATA_CONST.KEY_ACTIVE);
    return keyActive;
  }

  Future<String> getVersionApp() async {
    var versionApp = await localPreferences.getString(DATA_CONST.VERSION_APP);
    return versionApp;
  }

  Future<bool> cacheSession(String session) {
    return localPreferences.saveString(DATA_CONST.SESSION, session);
  }

  Future<bool> cacheKeyActive(String value) {
    return localPreferences.saveString(DATA_CONST.KEY_ACTIVE, value);
  }

  Future<bool> cacheVersionApp(String value) {
    return localPreferences.saveString(DATA_CONST.VERSION_APP, value);
  }

  Future<bool> logout() async {
    return await localPreferences.logout();
  }

//   Future<DataResponse> getGenerateToken() async {
//     final client = KongRestClient(dio);
//     var authorazion = "Basic dHVhbmhhQGZwdC5jb20udm46MTIzNDU2";
//     var dataResponse =
//         DataResponse(statusCode: 0, message: 'Init data response');
// //    return client.getGenerateToken(authorazion);
//     return client.getGenerateToken(authorazion).then((value) {
//       dataResponse.data = value;
//       dataResponse.statusCode = 200;
//       return dataResponse;
//     }).catchError((Object obj) {
//       switch (obj.runtimeType) {
//         case DioError:
//           // Here's the sample to get the failed response error code and message
//           final res = (obj as DioError).response;
//           print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
//           dataResponse.message = res?.statusMessage ?? "DioError";
//           dataResponse.statusCode = res?.statusCode ?? 0;
//           return dataResponse;
//           break;
//         default:
//       }
//     });
//   }
//
//   Future<CheckVerionResponse> checkVersion(Map<String, dynamic> queries) async {
//     final client = PartnerRestClient(dio);
//     String kongToken = await localPreferences.getString(DATA_CONST.KONG_TOKEN);
//     dio.options.headers["Authorization"] = 'Bearer $kongToken';
//     return client.getCheckVersion(queries);
//   }
//
//   Future<ProfileResponse> getProfile(String token, String kongToken) async {
//     dio.options.headers["Authorization"] =
//         kongToken; // config your dio headers globally
//     dio.options.headers["token"] = token;
//     final client = PartnerRestClient(dio);
//     return client.getProfile();
//   }
//
//   Future<LoginResponse> postLogin(
//       InputLogin inputLogin, String kongToken) async {
//     final client = AuthRestClient(dio);
//     dio.options.headers["Authorization"] =
//         kongToken; // config your dio headers globally
//     return client.postLogin(inputLogin);
//   }
//
//   Future<BaseApiResponse> postChangePassword(String token, String kongToken,
//       InputChangePassword inputChangPassword) async {
//     final client = AuthRestClient(dio);
//
//     String kongToken = await localPreferences.getString(DATA_CONST.KONG_TOKEN);
//     String token = await localPreferences.getString(DATA_CONST.SESSION);
//
//     dio.options.headers["Authorization"] =
//         'Bearer $kongToken'; // config your dio headers globally
//     dio.options.headers["token"] = token; //
//     return client.postChangePassword(inputChangPassword);
//   }

  // Future<BaseApiResponse> resetPassword(
  //     String kongToken, InputResetPassword inputResetPassword) async {
  //   dio.options.headers["Authorization"] =
  //       kongToken; // config your dio headers globally
  //   final client = AuthRestClient(dio);
  //   return client.postResetPassword(inputResetPassword);
  // }
  //
  // Future<BaseApiResponse> sendOtp(
  //     String kongToken, InputSendOtp inputSendOtp) async {
  //   dio.options.headers["Authorization"] =
  //       kongToken; // config your dio headers globally
  //   final client = AuthRestClient(dio);
  //   return client.postSendOtp(inputSendOtp);
  // }
  //
  // Future<BaseApiResponse> changePasswordFirstTime(
  //     String kongToken, InputResetPassword inputResetPassword) async {
  //   dio.options.headers["Authorization"] =
  //       kongToken; // config your dio headers globally
  //   final client = AuthRestClient(dio);
  //   return client.changePasswordFirstTime(inputResetPassword);
  // }
  //
  // Future<BaseApiResponse> postLogout(String token, String kongToken) async {
  //   print('calling api logout');
  //   final client = AuthRestClient(dio);
  //   dio.options.headers["Authorization"] = kongToken;
  //   dio.options.headers["token"] = token; // config your dio headers globally
  //   return client.postLogout();
  // }
}
