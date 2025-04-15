import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trackwallet/module/controller/transaction.dart';

class DescriptionArea extends GetView<TransactionController> {
  const DescriptionArea({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.description_outlined),
      ),
      maxLines: 2,
      onChanged: (value) {
        controller.description.value = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter a description";
        }

        return null;
      },
    );
  }
}
