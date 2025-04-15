import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trackwallet/module/controller/dashboard.dart';
import 'package:trackwallet/widget/icon.dart';

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
        shape: BeveledRectangleBorder(),
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
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? (currentTransaction.type == "income")
                                ? AppColors.darkIncome.withAlpha(25)
                                : AppColors.darkExpense.withAlpha(25)
                            : (currentTransaction.type == "income")
                            ? AppColors.income.withAlpha(25)
                            : AppColors.expense.withAlpha(25),

                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    getCategoryIcon(
                      iconName: category!.icon!,
                      isSystem: true,
                      type: category.type!,
                    ),
                    color:
                        currentTransaction.type == "income"
                            ? (Theme.of(context).brightness == Brightness.dark)
                                ? AppColors.income
                                : AppColors.darkIncome
                            : (Theme.of(context).brightness == Brightness.dark)
                            ? AppColors.expense
                            : AppColors.darkExpense,
                  ),
                ),
                title: Text(category.name!),
                subtitle: Text(currentTransaction.description!),
                trailing: Column(
                  children: [
                    Text(
                      "${currentTransaction.type == "income" ? "+" : "-"} ${NumberFormat.currency(symbol: "₺", decimalDigits: 2).format(double.parse(currentTransaction.amount!))}",
                      style: TextStyle(
                        color:
                            currentTransaction.type == "income"
                                ? (Theme.of(context).brightness ==
                                        Brightness.dark)
                                    ? AppColors.income
                                    : AppColors.darkIncome
                                : (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? AppColors.expense
                                : AppColors.darkExpense,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat("dd-MM-y").format(currentTransaction.date!),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
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
