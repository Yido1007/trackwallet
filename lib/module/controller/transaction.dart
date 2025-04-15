import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trackwallet/model/category.dart';
import 'package:trackwallet/model/transaction_parameters.dart';
import 'package:trackwallet/module/controller/base.dart';
import 'package:trackwallet/module/controller/dashboard.dart';
import 'package:trackwallet/repos/category.dart';
import 'package:trackwallet/repos/transaction.dart';

class TransactionController extends BaseController {
  final CategoryRepos _categoryRepos = Get.find<CategoryRepos>();
  final TransactionRepos _transactionRepos = Get.find<TransactionRepos>();

  final categories = <AppCategory>[].obs;
  final selectedCategoryID = "".obs;
  final transactionType = "expense".obs;
  final formKey = GlobalKey<FormState>();
  final amount = 0.0.obs;
  final description = "".obs;
  final date = DateTime.now().obs;

  @override
  void onInit() async {
    super.onInit();
    await loadCategories();

    ever(transactionType, (callback) {
      getFirsCategory();
    });
  }

  Future addTransaction() async {
    try {
      setLoading(true);
      if (!formKey.currentState!.validate()) return null;
      final transaction = Transaction(
        id: "",
        amount: amount.value,
        description: description.value,
        type: transactionType.value,
        date: date.value,
        categoryId: selectedCategoryID.value,
        userId: "",
      );
      var result = await _transactionRepos.addTransaction(transaction);
      if (result != null) {
        await Get.find<DashboardController>().refreshDashboard();
        Get.back();
        showSuccessSnackbar(message: "Transaction created");
        clearForm();
      }
    } catch (e) {
      showErrorSnackbar(message: "An Error occured while adding transaction");
      print(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> loadCategories() async {
    setLoading(true);
    try {
      final result = await _categoryRepos.getCategory();
      categories.value = result;
      getFirsCategory();
    } catch (e) {
      showErrorSnackbar(message: e.toString());
    } finally {
      setLoading(false);
    }
  }

  void getFirsCategory() {
    final filteredCategories =
        categories
            .where((category) => category.type == transactionType.value)
            .toList();
    if (filteredCategories.isNotEmpty) {
      selectedCategoryID.value = filteredCategories.first.id!;
    } else {
      selectedCategoryID.value = "";
    }
  }

  void clearForm() {
    amount.value = 0.0;
    description.value = "";
    date.value = DateTime.now();
    transactionType.value = "expense";
    selectedCategoryID.value = "";
  }
}
