import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

import '../../data/local_database_helper/database_helper.dart';
import '../models/reminder.dart';

class ReminderController extends GetxController {
  final TextEditingController medicineName = TextEditingController();
  final TextEditingController details = TextEditingController();
  final RxString selectedTime = ''.obs;
  final RxList<Reminder> reminders = <Reminder>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReminders();
    Alarm.init();
  }

  Future<void> deleteReminder(int id, int alarmId) async {
    try {
      await DatabaseHelper().deleteReminder(id);

      await Alarm.stop(alarmId);

      await fetchReminders();

      const CustomSnackBar(
        title: 'Success',
        message: 'Reminder deleted successfully',
      ).show();
    } catch (e) {
      const CustomSnackBar(
        title: 'Error',
        message: 'Failed to delete reminder',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    }
  }

  Future<void> deleteAllReminders() async {
    try {
      await DatabaseHelper().deleteAllReminders();

      for (var reminder in reminders) {
        await Alarm.stop(reminder.id ?? 1);
      }

      await fetchReminders();

      const CustomSnackBar(
        title: 'Success',
        message: 'All reminders deleted successfully',
      ).show();
    } catch (e) {
      const CustomSnackBar(
        title: 'Error',
        message: 'Failed to delete reminders',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    }
  }

  Future<void> fetchReminders() async {
    final data = await DatabaseHelper().getReminders();
    reminders.value = data;
  }

  Future<void> addReminder(Reminder reminder) async {
    await DatabaseHelper().insertReminder(reminder);
    await fetchReminders();
    medicineName.clear();
    details.clear();
    selectedTime.value = '';
  }

  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  Future<void> scheduleAlarm(String title, String body, TimeOfDay time) async {
    final now = DateTime.now();

    var scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (scheduledDateTime.isBefore(now)) {
      scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
    }

    // Generate a valid id within the allowed range
    final alarmId = now.millisecondsSinceEpoch % 2147483647;

    final alarmSettings = AlarmSettings(
      id: alarmId,
      // Use a valid id
      dateTime: scheduledDateTime,
      assetAudioPath: 'assets/media/audio/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      androidFullScreenIntent: true,
      notificationSettings: NotificationSettings(
        title: title,
        body: body,
        stopButton: 'Stop Alarm',
        icon: 'notification_icon',
      ),
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final formattedTime = picked.format(context);
      selectedTime.value = formattedTime;

      await scheduleAlarm(
        'Medicine Reminder',
        'It\'s time to take your medicine!',
        picked,
      );
    }
  }

  @override
  void onClose() {
    medicineName.dispose();
    details.dispose();
    super.onClose();
  }
}
