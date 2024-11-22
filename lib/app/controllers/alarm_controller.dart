import 'package:get/get.dart';

import '../../utils/colors.dart';

class AlarmController extends GetxController {
  var iconColor = AppColors.accentColor.obs;

  void toggleIconColor() {
    iconColor.value = (iconColor.value == AppColors.accentColor) ? AppColors.whiteColor : AppColors.accentColor;
  }
}
