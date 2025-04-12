import 'package:get/instance_manager.dart';
import 'package:trackwallet/module/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
