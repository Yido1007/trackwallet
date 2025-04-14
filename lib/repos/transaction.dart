import 'package:get/get.dart';
import 'package:trackwallet/model/transaction.dart';
import 'package:trackwallet/service/api.dart';

class TransactionRepos extends GetxService {
  late final ApiService _apiService;
  @override
  void onInit() {
    super.onInit();
    _apiService = Get.find<ApiService>();
  }

  Future<List<AppTransaction>> getTransaction() async {
    final response = await _apiService.get(ApiConstant.transactions);
    if (response.statusCode == 200) {
      var incomingList = response.data["transactions"] as List;
      return incomingList
          .map((transaction) => AppTransaction.fromJson(transaction))
          .toList();
    }
    throw Exception("An error occurred while fetching transaction");
  }

  Future<AppTransaction> addTransaction(AppTransaction transaction) async {
    final response = await _apiService.post(
      ApiConstant.transactions,
      data: transaction.toJson(),
    );
    if (response.statusCode == 201) {
      return AppTransaction.fromJson(response.data);
    }
    throw Exception("An error occurred while adding transaction");
  }

  Future<bool> deleteTransaction(String id) async {
    final response = await _apiService.delete(
      "${ApiConstant.transactions}/$id",
    );
    if (response.data == 200) {
      return true;
    }
    throw Exception("An error occurred while deleting transaction");
  }
}
