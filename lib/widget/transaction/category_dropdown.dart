import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../module/controller/transaction.dart';
import '../icon.dart';

class CategoryDropDown extends GetView<TransactionController> {
  const CategoryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Category',
          border: OutlineInputBorder(),
        ),
        value:
            controller.selectedCategoryID.value.isEmpty
                ? null
                : controller.selectedCategoryID.value,
        items:
            controller.categories
                .where((cat) => cat.type == controller.transactionType.value)
                .map(
                  (category) => DropdownMenuItem(
                    value: category.id,
                    child: Row(
                      children: [
                        Icon(
                          getCategoryIcon(
                            iconName: category.icon!,
                            isSystem: category.isSystem!,
                            type: category.type!,
                          ),
                        ),
                        Gap(8),
                        Text(category.name!),
                      ],
                    ),
                  ),
                )
                .toList(),
        onChanged: (value) {
          controller.selectedCategoryID.value = value!;
        },
      ),
    );
  }
}
