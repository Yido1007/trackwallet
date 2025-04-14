import 'package:get/get.dart';
import 'package:trackwallet/module/controller/base_controller.dart';
import 'package:trackwallet/model/user.dart';
import 'package:trackwallet/service/auth.dart';

class ProfileController extends BaseController {
  final Auth _auth = Get.find<Auth>();
  Rx<AppUser?> get user => _auth.currentUser;
}
