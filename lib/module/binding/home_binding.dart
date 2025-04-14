import 'package:get/instance_manager.dart';
import 'package:trackwallet/module/controller/home_controller.dart';
import 'package:trackwallet/module/controller/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
