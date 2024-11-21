import 'package:get/get.dart';

class SetupAccountController extends GetxController {
  RxInt selectedWeight = 85.obs;
  RxInt selectedHeight = 85.obs;
  RxInt selectedAge = 18.obs;

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
