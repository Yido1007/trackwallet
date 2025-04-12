import 'package:get/get.dart';
import 'package:trackwallet/core/base_controller.dart';
import 'package:trackwallet/core/routes.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/auth.dart';
import 'package:trackwallet/service/storage.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    await waitForServices();
    await checkTokenAndRedirect();
  }

  Future<void> waitForServices() async {
    while (!Get.isRegistered<Storage>() &&
        !Get.isRegistered<ApiService>() &&
        !Get.isRegistered<Auth>()) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<void> checkTokenAndRedirect() async {
    Get.offAllNamed(AppRoute.login);
  }
}
