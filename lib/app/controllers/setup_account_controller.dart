import 'package:get/get.dart';
import 'package:spera_mobile/app/routes/app_router.dart';

import '../../data/local_database_helper/database_helper.dart';

class SetupAccountController extends GetxController {
  RxInt selectedWeight = 85.obs;
  RxInt selectedHeight = 85.obs;
  RxInt selectedAge = 18.obs;
  var isPositive = true.obs;
  var selectedBloodType = ''.obs;

  void selectBloodType(String bloodType) {
    selectedBloodType.value = bloodType;
  }

  void toggleSign() {
    isPositive.value = !isPositive.value;
  }

  Future<void> finishSetup() async {
    final dbHelper = DatabaseHelper();
    await dbHelper.saveUserSetup(
      bloodType: selectedBloodType.value,
      isPositive: isPositive.value,
      weight: selectedWeight.value,
      height: selectedHeight.value,
      age: selectedAge.value,
    );
    Get.offAllNamed(AppRoutes.registerViewPath);
  }

  void updateWeight(int value) {
    selectedWeight.value = value;
  }

  void updateHeight(int value) {
    selectedHeight.value = value;
  }

  void updateAge(int value) {
    selectedAge.value = value;
  }
}
