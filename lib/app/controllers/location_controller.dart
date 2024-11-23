import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      // First, check location permission using permission_handler
      final status = await Permission.location.status;

      if (status.isGranted) {
        await _getCurrentLocation();
      } else if (status.isDenied) {
        // Request permission
        final result = await Permission.location.request();

        if (result.isGranted) {
          await _getCurrentLocation();
        } else {
          Get.snackbar(
            'Permission Denied',
            'Please allow location access to use this feature',
            snackPosition: SnackPosition.BOTTOM,
          );

          // Optionally open app settings if you want to let user enable permission
          await openAppSettings();
        }
      } else if (status.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Denied',
          'Location permission is permanently denied. Please enable it from app settings.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          onTap: (_) async {
            await openAppSettings();
          },
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to handle location permission: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Check if location service is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          'Location Service Disabled',
          'Please enable location services',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Request permissions from Geolocator if required
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'Permission Denied',
            'Location permissions are denied',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          'Permission Denied',
          'Location permissions are permanently denied',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update observables
      latitude.value = position.latitude;
      longitude.value = position.longitude;

      // Log the location for debugging
      print("Location retrieved: ${position.latitude}, ${position.longitude}");
    } catch (e) {
      print("Error in _getCurrentLocation: $e");
      Get.snackbar(
        'Error',
        'Failed to get location: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}