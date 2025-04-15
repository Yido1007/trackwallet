import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trackwallet/module/controller/transaction.dart';

class DateArea extends GetView<TransactionController> {
  const DateArea({super.key});
  String _formatDate(DateTime date) {
    return DateFormat("d MMMM y").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: Text("Date"),
        subtitle: Text(_formatDate(controller.date.value)),
        trailing: Icon(Icons.calendar_month),
        onTap: () async {
          final DateTime? seletedDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
          );
          if (seletedDate != null) {
            controller.date.value = seletedDate;
          }
        },
      ),
    );
  }
}
