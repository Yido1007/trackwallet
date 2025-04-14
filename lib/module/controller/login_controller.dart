import 'package:get/get.dart';
import 'package:trackwallet/module/controller/base_controller.dart';
import 'package:trackwallet/core/routes.dart';
import 'package:trackwallet/service/auth.dart';

class LoginController extends BaseController {
  late final Auth _auth;
  @override
  void onInit() {
    super.onInit();
    _auth = Get.find<Auth>();
  }

  googleSignController() async {
    final user = await _auth.signInWithGoogle();
    if (user != null) {
      Get.offAllNamed(AppRoute.home);
    }
  }
}
