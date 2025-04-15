import 'package:get/get.dart';
import 'package:trackwallet/model/transaction.dart';
import 'package:trackwallet/module/controller/base.dart';
import 'package:trackwallet/repos/transaction.dart';

class DashboardController extends BaseController {
  late final TransactionRepos _transactionRepos;

  @override
  void onInit() async {
    super.onInit();
    _transactionRepos = Get.find<TransactionRepos>();
    await getTransactions();
  }

  final myTransaction = <AppTransaction>[].obs;

  Future getTransactions() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepos.getTransaction();
      myTransaction.value = transactions;
    } catch (e) {
      showErrorSnackbar(message: "An error occurred while fetching data");
    } finally {
      setLoading(false);
    }
  }
}
