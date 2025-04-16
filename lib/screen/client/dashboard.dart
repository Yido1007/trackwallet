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
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SummaryCard(
                            title: "Monthly Income",
                            amount: 150,
                            icon: Icons.arrow_upward,
                            color: AppColors.income,
                            gradientColor: AppColors.incomeGradient,
                          ),
                          SummaryCard(
                            title: "Monthly Expense",
                            amount: 450,
                            icon: Icons.arrow_upward,
                            color: AppColors.income,
                            gradientColor: AppColors.incomeGradient,
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 9, child: TransactionList()),
                  ],
                ),
      ),
    );
  }
}
