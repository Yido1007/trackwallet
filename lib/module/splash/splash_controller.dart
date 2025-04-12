import 'package:get/get.dart';
import 'package:trackwallet/core/base_controller.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/storage.dart';

class SplashController extends BaseController {
  final areServicesReady = false.obs;
  @override
  void onReady() async {
    super.onReady();
    await checkServices();
    areServicesReady.value = true;
  }

  Future<void> checkServices() async {
    while (!Get.isRegistered<Storage>() && !Get.isRegistered<ApiService>()) {
      await Future.delayed(Duration(seconds: 1));
    }
    var map = Get.find<Storage>().getAllValues();
    print(map);
  }
}
