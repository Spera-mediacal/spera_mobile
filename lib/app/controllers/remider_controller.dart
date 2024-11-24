import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/local_database_helper/database_helper.dart';
import '../models/reminder.dart';
import '../services/notification_service/notification_helper.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReminderController extends GetxController {
  final TextEditingController medicineName = TextEditingController();
  final TextEditingController details = TextEditingController();
  final RxString selectedTime = ''.obs;
  final RxList<Reminder> reminders = <Reminder>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReminders();
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

  Future<void> scheduleNotification(
      String title, String body, TimeOfDay time) async {
    final now = DateTime.now();

    final scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_channel',
          'Reminders',
          channelDescription: 'Reminder Notifications',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final formattedTime = picked.format(context);
      selectedTime.value = formattedTime;

      await scheduleNotification(
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
