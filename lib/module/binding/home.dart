import 'package:get/instance_manager.dart';
import 'package:trackwallet/module/controller/dashboard.dart';
import 'package:trackwallet/module/controller/home.dart';
import 'package:trackwallet/module/controller/profile.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
