import 'package:get/instance_manager.dart';
import 'package:trackwallet/service/api.dart';
import 'package:trackwallet/service/auth.dart';
import 'package:trackwallet/service/storage.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<Storage>(() async {
      final service = Storage();
      await service.init();
      return service;
    });
    await Get.putAsync<ApiService>(() async {
      final service = ApiService();
      await service.init();
      return service;
    });

    await Get.putAsync<Auth>(() async {
      final service = Auth();
      await service.init();
      return service;
    });
  }
}
