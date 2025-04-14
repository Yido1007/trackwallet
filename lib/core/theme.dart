import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/service/storage.dart';

class ThemeService extends GetxService {
  late final Storage _storage;
  final _isDarkTheme = false.obs;
  bool get isDarkTheme => _isDarkTheme.value;

  @override
  void onInit() {
    super.onInit();
    _storage = Get.find<Storage>();
    loadThemeMode();
  }

  void loadThemeMode() {
    final saveTheme = _storage.getValue<String>(StorageKeys.themeMode);
    if (saveTheme != null) {
      _isDarkTheme.value = saveTheme == "dark";
      Get.changeThemeMode(
        _isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
      );
    } else {
      final brightness = Get.theme.brightness;
      _isDarkTheme.value = brightness == Brightness.dark;
    }
  }

  Future<void> toggleTheme() async {
    _isDarkTheme.value = !_isDarkTheme.value;
    Get.changeThemeMode(_isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
    await _storage.setValue<String>(
      StorageKeys.themeMode,
      _isDarkTheme.value ? "dark" : "light",
    );
  }
}
