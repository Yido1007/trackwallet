import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:trackwallet/module/controller/transaction.dart';
import 'package:trackwallet/theme/app_colors.dart';
import 'package:trackwallet/widget/transaction/category_dropdown.dart';
import 'package:trackwallet/widget/transaction/amount.dart';
import 'package:trackwallet/widget/transaction/date.dart';
import 'package:trackwallet/widget/transaction/description.dart';
import 'package:trackwallet/widget/transaction/save.dart';
import 'package:trackwallet/widget/transaction/type_selector.dart';

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
                : SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TransactionTypeSelector(),
                        Gap(10),
                        Row(
                          children: [
                            Expanded(child: CategoryDropDown()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: AppColors.darkTiffanyBlue,
                              ),
                            ),
                          ],
                        ),
                        Gap(10),
                        AmountArea(),
                        Gap(10),
                        DescriptionArea(),
                        Gap(10),
                        DateArea(),
                        Gap(10),
                        SaveButton(),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
