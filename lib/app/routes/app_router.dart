import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/views/login_view.dart';
import 'package:spera_mobile/app/views/auth_view/views/register_view.dart';
import 'package:spera_mobile/app/views/auth_view/views/setup_account_view.dart';

import '../views/onboarding_view/views/onboarding_view.dart';

class AppRoutes {
  static String loginViewPath = '/login';
  static String registerViewPath = '/register';
  static String onboardingViewPath = '/onboarding';
  static String setUpViewPath = '/setUp';

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
      ),GetPage(
        name: setUpViewPath,
        page: () => const SetupAccountView(),
      ),
    ];
  }
}
