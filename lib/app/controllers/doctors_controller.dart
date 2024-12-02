import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:spera_mobile/utils/constants.dart';

 import '../models/doctor_model.dart';

class DoctorsController extends GetxController {
  final Dio dio = Dio();
  RxList<DoctorModel> doctorsList = <DoctorModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  //localIP = 127.0.0.1:8000
  Future<void> fetchDoctors() async {
      String apiUrl = "http://${Constants.localIP}/api/doctor";
    isLoading.value = true;

    try {
      final response = await dio.get(
        apiUrl,
        options: Options(
          headers: {
            "accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['message'];
        doctorsList.value = data
            .map((json) => DoctorModel(
          id: int.parse(json['id']),
          name: json['name'],
          address: json['address'],
          image: json['image'],
          phone: json['phone'],
          specialization: json['specialization'],
          startHour: json['start'],
          endHour: json['end'],
          joinDate: json['joinDate'],
          workDays: List<String>.from(json['workDays']),
          rate: json['rate'],
        ))
            .toList();
      } else {
        errorMessage.value =
        "Failed to fetch data. Status code: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = "Error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
