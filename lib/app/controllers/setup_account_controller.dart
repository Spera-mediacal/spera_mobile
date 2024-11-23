import 'package:get/get.dart';

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
