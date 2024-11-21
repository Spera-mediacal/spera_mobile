import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spera_mobile/utils/global_widgets/custom_button.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../models/onboarding_model.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final PageController pageController = PageController();

    return SafeArea(
      child: Column(
        children: [
          (screenHeight(context) * 0.08).sh,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.onboardingItems.length,
              onPageChanged: (index) {
                controller.updatePage(index);
              },
              itemBuilder: (context, index) {
                OnboardingModel item = controller.onboardingItems[index];

                if (index == controller.onboardingItems.length - 1) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.image),
                        (screenHeight(context) * 0.05).sh,
                        Text(
                          item.title,
                          style: AppTextStyles.textStyle40,
                          textAlign: TextAlign.center,
                        ),
                        (screenHeight(context) * 0.05).sh,
                        Text(
                          item.desc,
                          style: AppTextStyles.textStyle24.copyWith(
                            color: AppTextStyles.textStyle24.color
                                ?.withOpacity(0.45),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        (screenHeight(context) * 0.05).sh,
                        CustomButton(
                          text: 'Get Started',
                          onTap: () {},
                          width: screenWidth(context) * 0.6,
                          height: screenHeight(context)*0.08,
                        ),
                      ],
                    ),
                  );
                }
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (pageController.position.haveDimensions) {
                      value = 1 - (pageController.page! - index).abs();
                      value = value.clamp(0.0, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(item.image),
                              (screenHeight(context) * 0.08).sh,
                              Text(item.title,
                                  style: AppTextStyles.textStyle40,
                                  textAlign: TextAlign.center),
                              (screenHeight(context) * 0.08).sh,
                              Text(
                                item.desc,
                                style: AppTextStyles.textStyle24.copyWith(
                                    color: AppTextStyles.textStyle24.color
                                        ?.withOpacity(0.45)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () {
              bool isLastPage = controller.currentPage ==
                  controller.onboardingItems.length - 1;

              return isLastPage
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: controller.onboardingItems.length,
                        effect: ExpandingDotsEffect(
                          dotWidth: 12,
                          dotHeight: 12,
                          activeDotColor: AppColors.whiteColor,
                          dotColor: Colors.grey.withOpacity(0.5),
                          expansionFactor: 3,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../models/onboarding_model.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final PageController pageController = PageController();

    return SafeArea(
      child: Column(
        children: [
          (screenHeight(context) * 0.1).sh,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.onboardingItems.length,
              onPageChanged: (index) {
                controller.updatePage(index);
              },
              itemBuilder: (context, index) {
                OnboardingModel item = controller.onboardingItems[index];

                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double value = 1.0;

                    if (pageController.position.haveDimensions) {
                      value = 1 - (pageController.page! - index).abs();
                      value = value.clamp(0.0, 1.0);
                    }

                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(item.image),
                              (screenHeight(context) * 0.08).sh,
                              Text(
                                item.title,
                                style: AppTextStyles.textStyle40,
                                textAlign: TextAlign.center,
                              ),
                              (screenHeight(context) * 0.08).sh,
                              Text(
                                item.desc,
                                style: AppTextStyles.textStyle24.copyWith(
                                  color: AppTextStyles.textStyle24.color
                                      ?.withOpacity(0.45),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: controller.onboardingItems.length,
              effect: ExpandingDotsEffect(
                dotWidth: 12,
                dotHeight: 12,
                activeDotColor: AppColors.whiteColor,
                dotColor: Colors.grey.withOpacity(0.5),
                expansionFactor: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../models/onboarding_model.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final PageController pageController = PageController();

    return SafeArea(
      child: Column(
        children: [
          (screenHeight(context) * 0.1).sh,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.onboardingItems.length,
              onPageChanged: (index) {
                controller.updatePage(index);
              },
              itemBuilder: (context, index) {
                OnboardingModel item = controller.onboardingItems[index];

                return AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.image),
                        (screenHeight(context) * 0.08).sh,
                        Text(
                          item.title,
                          style: AppTextStyles.textStyle40,
                          textAlign: TextAlign.center,
                        ),
                        (screenHeight(context) * 0.08).sh,
                        Text(
                          item.desc,
                          style: AppTextStyles.textStyle24.copyWith(
                            color: AppTextStyles.textStyle24.color
                                ?.withOpacity(0.45),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: controller.onboardingItems.length,
              effect: const ScrollingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: AppColors.whiteColor,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:spera_mobile/utils/text_styles.dart';

import '../../../../utils/size_config.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            (screenHeight(context) * 0.1).sh,
            Image.asset('assets/media/onboarding/onboarding_1.png'),
            (screenHeight(context) * 0.08).sh,
            Text(
              'Welcome to Spera',
              style: AppTextStyles.textStyle40,
            ),
            (screenHeight(context) * 0.08).sh,
            Text(
              'Join our mission to make healthcare accessible for everyone. Donate blood, find pharmacies, and manage your health all in one app',
              style: AppTextStyles.textStyle24.copyWith(
                color: AppTextStyles.textStyle24.color?.withOpacity(0.45),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
*/
