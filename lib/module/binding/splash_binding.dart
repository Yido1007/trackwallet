import 'package:get/instance_manager.dart';
import 'package:trackwallet/module/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
