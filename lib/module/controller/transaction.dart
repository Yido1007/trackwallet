import 'package:get/get.dart';
import 'package:trackwallet/model/category.dart';
import 'package:trackwallet/module/controller/base.dart';
import 'package:trackwallet/repos/category.dart';
import 'package:trackwallet/repos/transaction.dart';

class TransactionController extends BaseController {
  final CategoryRepos _categoryRepos = Get.find<CategoryRepos>();
  final TransactionRepos _transactionRepos = Get.find<TransactionRepos>();

  final categories = <AppCategory>[].obs;
  final selectedCategoryID = "".obs;
  final transactionType = "expense".obs;

  @override
  void onInit() async {
    super.onInit();
    await loadCategories();

    ever(transactionType, (callback) {
      getFirsCategory();
    });
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
      selectedCategoryID.value = filteredCategories.first.id;
    } else {
      selectedCategoryID.value = "";
    }
  }
}
