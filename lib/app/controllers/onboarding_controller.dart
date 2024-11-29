import 'package:get/get.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var onboardingItems = <OnboardingModel>[
    OnboardingModel(
      title: "title1".tr,
      desc:
          "desc1".tr,
      image: "assets/media/onboarding/onboarding_1.png",
    ),
    OnboardingModel(
      title: "title2".tr,
      desc:
          "desc2".tr,
      image: "assets/media/onboarding/onboarding_2.png",
    ),
    OnboardingModel(
      title: "title3".tr,
      desc:
          "desc3".tr,
      image: "assets/media/onboarding/onboarding_3.png",
    ),
    OnboardingModel(
      title: "title4".tr,
      desc:
          "desc4".tr,
      image: "assets/media/onboarding/onboarding_4.png",
    ),
    OnboardingModel(
      title: "title5".tr,
      desc:
          "desc5".tr,
      image: "assets/media/onboarding/onboarding_5.png",
    ),
  ].obs;

  var currentPage = 0.obs;

  void updatePage(int pageIndex) {
    currentPage.value = pageIndex;
  }
}
