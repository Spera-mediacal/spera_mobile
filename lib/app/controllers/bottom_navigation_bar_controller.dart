import 'package:get/get.dart';
import 'package:spera_mobile/app/views/home_view/views/home_view.dart';

import '../views/blood_donation_view/view/blood_donation_view.dart';
import '../views/nearest_pharm_view/view/nearest_pharm_view.dart';
import '../views/reminder_view/views/reminder_view.dart';

class BottomNavigationBarController extends GetxController {
  List views = [
    const HomeView(),
    const BloodDonationView(),
    const NearestPharmView(),
    const ReminderView(),
  ];

  var currentIndex = 0.obs;

  void changeIndex({required int newIndex}) {
    currentIndex.value = newIndex;
  }
}
