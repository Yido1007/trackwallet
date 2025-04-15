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
  }

  Future<void> loadCategories() async {
    setLoading(true);
    try {
      final result = await _categoryRepos.getCategory();
      categories.value = result;
    } catch (e) {
      showErrorSnackbar(message: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
