import 'package:get/get.dart';
import 'package:trackwallet/module/controller/transaction.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }
}
