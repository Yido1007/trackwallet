import 'package:get/get.dart';
import 'package:trackwallet/core/base_controller.dart';
import 'package:trackwallet/core/routes.dart';

import '../../service/auth.dart';

class HomeController extends BaseController {
  logOut() async {
    await Get.find<Auth>().signOut();
    Get.offAllNamed(AppRoute.login);
  }
}
