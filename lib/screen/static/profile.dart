import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:trackwallet/widget/profile_card.dart';

import '../../module/controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                controller.user.value?.profilePhoto ?? "",
              ),
            ),
            Gap(24),
            UserCard(
              title: "Adı",
              value: controller.user.value?.firstName ?? "",
            ),
            UserCard(
              title: "Soyadı",
              value: controller.user.value?.lastName ?? "",
            ),
            UserCard(title: "Mail", value: controller.user.value?.email ?? ""),
          ],
        ),
      ),
    );
  }
}
