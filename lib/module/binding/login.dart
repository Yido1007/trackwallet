import 'package:get/instance_manager.dart';
import 'package:trackwallet/module/controller/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
