import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/dashboard.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        itemBuilder: (context, index) {
          var currentTransaction = controller.myTransaction[index];
          var category = currentTransaction.category;
          return Dismissible(
            key: ValueKey(currentTransaction.id),
            child: ListTile(
              title: Text(category!.name!),
              subtitle: Text(currentTransaction.description!),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
        itemCount: controller.myTransaction.length,
      ),
    );
  }
}
