import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/global_widgets/custom_button.dart';
import 'package:spera_mobile/utils/global_widgets/custom_text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/remider_controller.dart';
import '../../../models/reminder.dart';
import '../../home_view/widgets/side_title.dart';
import 'alarm_container.dart';

class ReminderViewBody extends StatelessWidget {
  ReminderViewBody({super.key});

  final ReminderController reminderController = Get.put(ReminderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Reminder',
                style: AppTextStyles.textStyle35,
              ),
              (screenHeight(context) * 0.04).sh,
              SideTitle(
                onTap: () {
                  Get.defaultDialog(
                    content: SizedBox(
                      width: screenWidth(context) * 0.9,
                      height: screenHeight(context) * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Medicine name',
                              prefixIcon: HugeIcons.strokeRoundedMedicine02,
                              controller: reminderController.medicineName,
                            ),
                            CustomTextField(
                              height: 60,
                              hintText: 'Details',
                              prefixIcon: HugeIcons.strokeRoundedProfile,
                              controller: reminderController.details,
                            ),
                            const Spacer(),
                            Obx(() {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      reminderController.selectedTime.value.isEmpty
                                          ? 'No time selected'
                                          : 'Selected time: ${reminderController.selectedTime.value}',
                                      style: AppTextStyles.textStyle15,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () => reminderController.pickTime(context),
                                  ),
                                ],
                              );
                            }),
                            const Spacer(),
                            CustomButton(
                              text: 'Add',
                              onTap: () {
                                if (reminderController.medicineName.text.isEmpty ||
                                    reminderController.details.text.isEmpty ||
                                    reminderController.selectedTime.value.isEmpty) {
                                  Get.snackbar(
                                    'Error',
                                    'Please fill in all fields and select a time',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                final reminder = Reminder(
                                  name: reminderController.medicineName.text,
                                  details: reminderController.details.text,
                                  time: reminderController.selectedTime.value,
                                );

                                reminderController.addReminder(reminder);
                                Get.back();
                              },
                              width: (screenWidth(context) * 1),
                              height: (screenHeight(context) * 0.03),
                              borderRadius: 12,
                            )

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
                title: "All Reminders",
                action: "Add Reminder",
              ),
              (screenHeight(context) * 0.04).sh,
              Obx(() {
                final reminders = reminderController.reminders;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: reminders.length,
                  itemBuilder: (context, index) {
                    final reminder = reminders[index];
                    return AlarmContainer(
                      name: reminder.name,
                      details: '${reminder.details} | Time: ${reminder.time}',
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
