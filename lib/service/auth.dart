import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/storage.dart';

import '../model/user.dart';

class Auth extends GetxService {
  late final Storage _storage;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  Future<Auth> init() async {
    _storage = Get.find<Storage>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn(serverClientId: ApiConstant.serverClientUrl);
    return this;
  }

  signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      if (_googleUser == null) return null;
      final GoogleSignInAuthentication _googleAuthentication =
          await _googleUser.authentication;
      // print("google auth: ${_googleAuthentication.idToken}");
      final response = await _apiService.post(
        ApiConstant.login,
        data: {'idToken': _googleAuthentication.idToken},
      );
      if (response.statusCode == 200) {
        await _storage.setValue<String>(
          StorageKeys.userToken,
          response.data['token'],
        );
        print("JWT Token");
        print(response.data['token']);
      }
      // _googleAuthentication.idToken;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _storage.remove(StorageKeys.userToken);
    } catch (e) {
      print("An error occurred while logging out $e");
    }
  }

  Future<AppUser?> getProfile() async {
    try {
      final response = await _apiService.get(ApiConstant.profile);
      if (response.statusCode == 200) {
        return AppUser.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Get profile error $e");
      return null;
    }
  }
}
