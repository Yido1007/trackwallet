import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/dashboard.dart';
import 'package:trackwallet/widget/dashboard/list.dart';

import '../../theme/app_colors.dart';
import '../../widget/dashboard/card.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>
            controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(8),
                          children: [
                            SummaryCard(
                              title: "Aylık Gelir",
                              amount: controller.monthlyIncome.value,
                              icon: Icons.arrow_upward,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkIncome
                                      : AppColors.income,
                              gradientColor:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkIncomeGradient
                                      : AppColors.incomeGradient,
                            ),
                            SummaryCard(
                              title: "Aylık Gider",
                              amount: controller.monthlyExpens.value,
                              icon: Icons.arrow_downward,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkExpense
                                      : AppColors.expense,
                              gradientColor:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkExpenseGradient
                                      : AppColors.expenseGradient,
                            ),
                            SummaryCard(
                              showSign: true,
                              title: "Aylık Bakiye",
                              amount:
                                  (controller.monthlyIncome.value -
                                      controller.monthlyExpens.value),
                              icon: Icons.account_balance_wallet_outlined,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkBalance
                                      : AppColors.balance,
                              gradientColor:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkBalanceGradient
                                      : AppColors.balanceGradient,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 9, child: TransactionList()),
                  ],
                ),
      ),
    );
  }
}
