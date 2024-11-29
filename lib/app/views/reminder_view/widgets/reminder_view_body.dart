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
               Text(
                'Reminder'.tr,
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
                              hintText: 'medicineName'.tr,
                              prefixIcon: HugeIcons.strokeRoundedMedicine02,
                              controller: reminderController.medicineName,
                            ),
                            CustomTextField(
                              height: 60,
                              hintText: 'Details'.tr,
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
                                          ? 'noTime'.tr
                                          : 'selectedTime: ${reminderController.selectedTime.value}'.tr,
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
                              text: 'Add'.tr,
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
                                  id: DateTime.now().millisecondsSinceEpoch, // temporary id generation
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
                    title: 'addReminder'.tr,
                    backgroundColor: AppColors.greyColor,
                    titleStyle: AppTextStyles.textStyle24,
                  );
                },
                title: "allReminders".tr,
                action: "addReminder".tr,
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
                    return Dismissible(
                      key: Key(reminder.id.toString()), // Make sure Reminder model has an id field
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        return await Get.dialog<bool>(
                          AlertDialog(
                            title: const Text('Delete Reminder'),
                            content: const Text('Are you sure you want to delete this reminder?'),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(result: false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Get.back(result: true),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ) ?? false;
                      },
                      onDismissed: (direction) {
                        reminderController.deleteReminder(reminder.id ?? 1, index);
                      },
                      child: AlarmContainer(
                        name: reminder.name,
                        details: '${reminder.details} | Time: ${reminder.time}',
                      ),
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
