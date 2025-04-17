import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackwallet/model/transaction.dart';
import 'package:trackwallet/module/controller/base.dart';
import 'package:trackwallet/repos/transaction.dart';

class DashboardController extends BaseController {
  late final TransactionRepos _transactionRepos;

  final monthlyIncome = 0.0.obs;
  final monthlyExpens = 0.0.obs;

  void monthlySummary() {
    monthlyExpens.value = 0;
    monthlyIncome.value = 0;
    var currentDate = DateTime.now();
    var currentYear = currentDate.year;
    var currentMonth = currentDate.month;
    if (myTransaction.isNotEmpty) {
      var filteredTransaction =
          myTransaction
              .where(
                (transaction) =>
                    transaction.date!.year == currentYear &&
                    transaction.date!.month == currentMonth,
              )
              .toList();
      for (var tr in filteredTransaction) {
        if (tr.type == "income") {
          monthlyIncome.value += double.parse(tr.amount!);
        } else {
          monthlyExpens.value += double.parse(tr.amount!);
        }
      }
    } else {
      monthlyExpens.value = 0;
      monthlyIncome.value = 0;
    }
    debugPrint("Aylık gelir: $monthlyIncome gider: $monthlyExpens");
  }

  @override
  void onInit() async {
    super.onInit();
    _transactionRepos = Get.find<TransactionRepos>();
    await getTransactions();
  }

  Future<void> refreshDashboard() async {
    await getTransactions();
  }

  final myTransaction = <AppTransaction>[].obs;

  Future getTransactions() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepos.getTransaction();
      myTransaction.value = transactions;
      monthlySummary();
    } catch (e) {
      showErrorSnackbar(message: "Veriler getirilirken hata oluştu");
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteTransactions(String id) async {
    try {
      final transactionResult = await _transactionRepos.deleteTransaction(id);
      if (transactionResult) {
        myTransaction.removeWhere((element) => element.id == id);
        monthlySummary();
        showSuccessSnackbar(message: "İşlem Silindi");
      } else {
        showErrorSnackbar(message: "Veriler silinirken hata oluştu");
      }
    } catch (e) {
      showErrorSnackbar(message: "Veriler silinirken hata oluştu $e");
    } finally {}
  }
}
