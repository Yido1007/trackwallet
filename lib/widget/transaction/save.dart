import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/transaction.dart';
import 'package:trackwallet/theme/app_colors.dart';

class SaveButton extends GetView<TransactionController> {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        await controller.addTransaction();
      },
      label: Text(
        "Kaydet",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      icon: Icon(Icons.save_outlined),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkTiffanyBlue,
      ),
    );
  }
}
