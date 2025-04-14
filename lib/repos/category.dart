import 'package:get/get.dart';
import 'package:trackwallet/model/category.dart';
import 'package:trackwallet/service/api.dart';

class CategoryRepos extends GetxService {
  late final ApiService _apiService;
  @override
  void onInit() {
    super.onInit();
    _apiService = Get.find<ApiService>();
  }

  Future<List<AppCategory>> getCategory() async {
    final response = await _apiService.get(ApiConstant.categories);
    if (response.statusCode == 200) {
      var incomingList = response.data as List;
      return incomingList
          .map((category) => AppCategory.fromJson(category))
          .toList();
    }
    throw Exception("An error occurred while fetching categories");
  }

  Future<AppCategory> addCategory(AppCategory category) async {
    final response = await _apiService.post(
      ApiConstant.categories,
      data: category.toJson(),
    );
    if (response.statusCode == 201) {
      return AppCategory.fromJson(response.data);
    }
    throw Exception("An error occurred while adding categories");
  }
}
