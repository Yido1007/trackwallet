import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/transaction.dart';
import 'package:trackwallet/widget/transaction.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add transactions")),
      body: Obx(
        () =>
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(child: TransactionTypeSelector()),
      ),
    );
  }
}
