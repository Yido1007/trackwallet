import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomeScreen"),
            ElevatedButton(
              onPressed: () async {
                await controller.logOut();
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
