import 'package:get/get.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var onboardingItems = <OnboardingModel>[
    OnboardingModel(
      title: "Welcome to Spera",
      desc:
          "Join our mission to make healthcare accessible for everyone. Donate blood, find pharmacies, and manage your health all in one app",
      image: "assets/media/onboarding/onboarding_1.png",
    ),
    OnboardingModel(
      title: "Simplified Blood Donation",
      desc:
          "Register as a blood donor or request blood in emergencies. Together, we can save lives with just a few clicks",
      image: "assets/media/onboarding/onboarding_2.png",
    ),
    OnboardingModel(
      title: "Your Personal",
      desc:
          "Use AI-powered X-ray analysis and a medical chat bot to get instant health insights and advice.",
      image: "assets/media/onboarding/onboarding_3.png",
    ),
    OnboardingModel(
      title: "Locate & Nearby Services",
      desc:
          "Book appointments at nearby clinics or locate the closest pharmacy with ease. Healthcare is now just around the corner!",
      image: "assets/media/onboarding/onboarding_4.png",
    ),
    OnboardingModel(
      title: "Stay Organized & Earn Points",
      desc:
          "Set reminders, track appointments, and earn points for app engagement to redeem exciting rewards!",
      image: "assets/media/onboarding/onboarding_5.png",
    ),
  ].obs;

  var currentPage = 0.obs;

  void updatePage(int pageIndex) {
    currentPage.value = pageIndex;
  }
}
