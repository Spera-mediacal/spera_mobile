import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/views/login_view.dart';
import '../views/onboarding_view/views/onboarding_view.dart';

class AppRoutes {
  static String onboardingViewPath = '/Onboarding';
  static String authViewPath = '/auth';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: authViewPath, page: () => const LoginView(),),
      GetPage(name: onboardingViewPath, page: () => const OnboardingView(),),
    ];
  }
}