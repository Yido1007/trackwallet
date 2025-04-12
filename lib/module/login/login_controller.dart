import 'package:get/get.dart';
import 'package:trackwallet/core/base_controller.dart';
import 'package:trackwallet/service/auth.dart';

class LoginController extends BaseController {
  late final Auth _auth;
  @override
  void onInit() {
    super.onInit();
    _auth = Get.find<Auth>();
  }

  googleSignController() async {
    await _auth.signInWithGoogle();
  }
}
