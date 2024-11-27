import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
import 'package:spera_mobile/utils/constants.dart';

import '../../data/local_database_helper/database_helper.dart';
import '../models/user_model.dart';
import '../services/shared_pref_service/sahred_pref_service.dart';

class SetupAccountController extends GetxController {
  RxString fullName = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString userId = ''.obs;
  RxInt selectedWeight = 85.obs;
  RxInt selectedHeight = 85.obs;
  RxInt selectedAge = 18.obs;
  var isPositive = true.obs;
  var selectedBloodType = ''.obs;

  final Dio dio = Dio();

  void selectBloodType(String bloodType) {
    selectedBloodType.value = bloodType;
  }

  void toggleSign() {
    isPositive.value = !isPositive.value;
  }

  Future<void> _loadInitailData() async {
    final name = await SharedPreferencesHelper.getName();
    final phone = await SharedPreferencesHelper.getPhone();
    final id = await SharedPreferencesHelper.getId();

    print('setup_controller name: $name phone $phone id $id');

    fullName.value = name ?? 'Guest';
    phoneNumber.value = phone ?? "000000";
    userId.value = id ?? "000000";
  }

  Future<void> finishSetup() async {
    await _loadInitailData();

    final user = User(
      fullName: fullName.value,
      id: userId.value,
      phoneNumber: phoneNumber.value,
      bloodType: selectedBloodType.value + (isPositive.value ? "+" : "-"),
      weight: selectedWeight.value,
      height: selectedHeight.value,
      age: selectedAge.value,
    );

    final dbHelper = DatabaseHelper();
    await dbHelper.saveUserSetup(
      fullName: user.fullName,
      phoneNumber: user.phoneNumber,
      userId: user.id,
      bloodType: user.bloodType,
      isPositive: isPositive.value,
      weight: user.weight,
      height: user.height,
      age: user.age,
    );

    await submitUserData(user);

    Get.offAllNamed(AppRoutes.bottomViewPath);
  }

  Future<void> submitUserData(User user) async {
    const String apiUrl = "http://${Constants.localIP}/api/user";

    try {
      final response = await dio.post(
        apiUrl,
        data: user.toJson(),
        options: Options(
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("User data submitted successfully: ${response.data}");
      } else {
        print("Failed to submit user data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred while submitting user data: $e");
    }
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
