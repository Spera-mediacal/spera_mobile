import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/views/login_view.dart';
import 'package:spera_mobile/app/views/auth_view/views/register_view.dart';
import 'package:spera_mobile/app/views/auth_view/views/setup_account_view.dart';
import 'package:spera_mobile/app/views/home_view/views/medicines_view.dart';
import 'package:spera_mobile/app/views/home_view/views/spera_bot_view.dart';

import '../views/bottom_naviagtoion_bar/views/bottom_navigation_bar_view.dart';
import '../views/onboarding_view/views/onboarding_view.dart';

class AppRoutes {
  static String loginViewPath = '/login';
  static String registerViewPath = '/register';
  static String onboardingViewPath = '/onboarding';
  static String setUpViewPath = '/setUp';
  static String bottomViewPath = '/bottom';
  static String speraBotViewPath = '/speraBot';
  static String medicinesViewPath = '/medicines';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(
        name: loginViewPath,
        page: () => const LoginView(),
      ),
      GetPage(
        name: registerViewPath,
        page: () => const RegisterView(),
      ),
      GetPage(
        name: onboardingViewPath,
        page: () => const OnboardingView(),
      ),
      GetPage(
        name: setUpViewPath,
        page: () => const SetupAccountView(),
      ),
      GetPage(
        name: bottomViewPath,
        page: () => BottomNavigationBarView(),
      ),
      GetPage(
        name: speraBotViewPath,
        page: () => const SperaBotView(),
      ),GetPage(
        name: medicinesViewPath,
        page: () => const MedicinesView(),
      ),
    ];
  }
}
