import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
import 'package:spera_mobile/app/services/envied_service/env.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'app/services/notification_service/notification_helper.dart';

Future<void> checkPermissions() async {
  final cameraPermission = await Permission.camera.status;
  final locationPermission = await Permission.location.status;
  final notificationPermission = await Permission.notification.status;
  // hello World
  if (cameraPermission.isDenied || cameraPermission.isPermanentlyDenied) {
    await Permission.camera.request();
  }

  if (locationPermission.isDenied || locationPermission.isPermanentlyDenied) {
    await Permission.location.request();
  }

  if (notificationPermission.isDenied || notificationPermission.isPermanentlyDenied) {
    await Permission.notification.request();
  }

   if (await Permission.camera.isPermanentlyDenied ||
      await Permission.location.isPermanentlyDenied ||
      await Permission.notification.isPermanentlyDenied) {
    openAppSettings(); // Redirect user to app settings
  }
}

// Omar Adel hassan sayed
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await SharedPreferences.getInstance();

    tz.initializeTimeZones();

    await Alarm.init();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    try {
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      debugPrint('Notification initialization error: $e');
    }

    try {
      await Supabase.initialize(
        url: Env.supabaseUrl,
        anonKey: Env.supabaseAnonKey,
      );
    } catch (e) {
      debugPrint('Supabase initialization error: $e');
      rethrow;
    }

    await checkPermissions(); // Add the permission check here

    runApp(const MyApp());
  } catch (e, stackTrace) {
    debugPrint('Initialization error: $e');
    debugPrint('Stack trace: $stackTrace');
    runApp(const ErrorApp());
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                'Failed to initialize app',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  main();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );

    final supabase = Supabase.instance.client;
    final initialRoute = supabase.auth.currentUser != null
        ? AppRoutes.bottomViewPath
        : AppRoutes.onboardingViewPath;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppRoutes.getRoutes(),
          theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accentColor,
        ),
        fontFamily: 'Manjari',
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
    );
  }
}