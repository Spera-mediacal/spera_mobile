import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/global_widgets/custom_text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import 'alarm_container.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Reminder',
              style: AppTextStyles.textStyle35,
            ),
            (screenHeight(context) * 0.04).sh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'All Reminders',
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      content: SizedBox(
                        width: screenWidth(context) * 0.9,
                        height: screenHeight(context) * 0.35,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              const CustomTextField(
                                hintText: 'Medicine name',
                                prefixIcon: HugeIcons.strokeRoundedMedicine02,
                              ),
                              const CustomTextField(
                                height: 60,
                                hintText: 'details',
                                prefixIcon: HugeIcons.strokeRoundedProfile,
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(screenWidth(context) * 1,
                                        screenHeight(context) * 0.05),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: AppColors.accentColor),
                                child: Text(
                                  'Add',
                                  style: AppTextStyles.textStyle24.copyWith(
                                      color: AppColors.bgColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      barrierDismissible: true,
                      titlePadding: const EdgeInsets.only(top: 25),
                      title: 'Add Reminder',
                      backgroundColor: AppColors.greyColor,
                      titleStyle: AppTextStyles.textStyle24,
                    );
                  },
                  child: Text(
                    'Add reminder',
                    style: AppTextStyles.textStyle19
                        .copyWith(color: AppColors.accentColor),
                  ),
                ),
              ],
            ),
            (screenHeight(context) * 0.04).sh,
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const AlarmContainer(
                  name: 'Neurotoxin',
                  count: 32,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
