import 'package:get/get.dart';
import 'package:trackwallet/module/controller/base.dart';
import 'package:trackwallet/core/routes.dart';

import '../../service/auth.dart';

class HomeController extends BaseController {
  final currentIndex = 0.obs;

  changePage(int index) {
    currentIndex.value = index;
  }

  logOut() async {
    await Get.find<Auth>().signOut();
    Get.offAllNamed(AppRoute.login);
  }
}
