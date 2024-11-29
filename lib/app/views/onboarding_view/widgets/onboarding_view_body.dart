import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
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
                          text: 'button'.tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.loginViewPath);
                          },
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
