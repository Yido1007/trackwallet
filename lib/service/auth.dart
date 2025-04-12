import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/storage.dart';

class Auth extends GetxService {
  late final Storage _storage;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  Future<Auth> init() async {
    _storage = Get.find<Storage>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn(
      serverClientId:
          '450435484678-5ph6ljrtatan2819jv4cmdg47e0d2cgp.apps.googleusercontent.com',
    );
    return this;
  }

  signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      print("google user ${_googleUser.toString()}");
      if (_googleUser == null) return null;
      final GoogleSignInAuthentication _googleAuthentication =
          await _googleUser.authentication;
      print("google auth: ${_googleAuthentication.idToken}");
      // _googleAuthentication.idToken;
    } catch (e) {
      print(e);
    }
  }
}
