import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/storage.dart';

import '../model/user.dart';

class Auth extends GetxService {
  late final Storage _storage;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  final Rx<AppUser?> currentUser = Rx<AppUser?>(null);

  Future<Auth> init() async {
    _storage = Get.find<Storage>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn(serverClientId: ApiConstant.serverClientUrl);
    return this;
  }

  Future<AppUser?> signInWithGoogle() async {
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
        var user = AppUser.fromJson(response.data['user']);
        currentUser.value = user;
        return user;
      } else {
        return null;
      }
      // _googleAuthentication.idToken;
    } catch (e) {
      print(e);
      currentUser.value = null;
      return null;
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
        currentUser.value = AppUser.fromJson(response.data);
        return AppUser.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Get profile error $e");
      return null;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final token = _storage.getValue<String>(StorageKeys.userToken);
      if (token == null) {
        currentUser.value = null;
        return false;
      }
      final response = await getProfile();
      if (response != null) {
        currentUser.value = response;
        return true;
      }
      return false;
    } catch (e) {
      await _storage.remove(StorageKeys.userToken);
      currentUser.value = null;
      return false;
    }
  }
}
