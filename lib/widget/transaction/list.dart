import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/dashboard.dart';

import '../../theme/app_colors.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.myTransaction.isEmpty) {
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 48,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTiffanyBlue.withAlpha(128)
                            : AppColors.tiffanyBlue.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "There is no transaction registered yet",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Card(
        child: ListView.separated(
          itemBuilder: (context, index) {
            var currentTransaction = controller.myTransaction[index];
            var category = currentTransaction.category;
            return Dismissible(
              key: ValueKey(currentTransaction.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.deleteTransactions(currentTransaction.id!);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.delete_outline, color: Colors.white),
              ),
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
    });
  }
}
