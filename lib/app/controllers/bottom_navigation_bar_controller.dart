import 'package:get/get.dart';
import 'package:spera_mobile/app/views/home_view/views/home_view.dart';
import 'package:spera_mobile/app/views/medical_news_view/view/medical_news_view.dart';

import '../views/blood_donation_view/view/blood_donation_view.dart';
 import '../views/reminder_view/views/reminder_view.dart';

class BottomNavigationBarController extends GetxController {
  List views = [
    const HomeView(),
    const BloodDonationView(),
    const MedicalNewsView(),
    const ReminderView(),
  ];

  var currentIndex = 0.obs;

  void changeIndex({required int newIndex}) {
    currentIndex.value = newIndex;
  }
}
