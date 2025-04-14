import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/home_controller.dart';
import 'package:trackwallet/screen/client/dashboard.dart';
import 'package:trackwallet/screen/static/profile.dart';
import 'package:trackwallet/theme/app_colors.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Wallet"),
        actions: [
          IconButton(
            onPressed: () {
              controller.logOut();
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [DashboardScreen(), ProfileScreen()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkHotPink,
        shape: CircleBorder(),
        child: Icon(Icons.add_rounded, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          gapLocation: GapLocation.center,
          backgroundColor: AppColors.darkTiffanyBlue,
          icons: [Icons.dashboard_outlined, Icons.person],
          activeIndex: controller.currentIndex.value,
          splashColor: Colors.white,
          activeColor: Colors.white.withAlpha(100),
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
