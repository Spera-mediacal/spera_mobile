import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<void> fetchReminders() async {
    final data = await DatabaseHelper().getReminders();
    reminders.value = data;
  }

  Future<void> addReminder(Reminder reminder) async {
    await DatabaseHelper().insertReminder(reminder);
    fetchReminders();
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

    final alarmSettings = AlarmSettings(
      id: reminders.length,
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
