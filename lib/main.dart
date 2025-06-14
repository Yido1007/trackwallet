import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/binding/app.dart';
import 'package:trackwallet/core/routes.dart';
import 'package:trackwallet/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initial,
      getPages: AppScreen.pages,
      initialBinding: AppBinding(),
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
    );
  }
}
