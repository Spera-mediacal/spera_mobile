import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var cityName = "Unknown".obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initializeLocation();
  }

  Future<void> initializeLocation() async {
    isLoading.value = true;

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude.value = position.latitude;
        longitude.value = position.longitude;
        await fetchCityName();
      } catch (e) {
        cityName.value = "Error retrieving location";
        print(e);
      }

    isLoading.value = false;
  }

  Future<bool> checkLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
      return status.isGranted;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return false;
  }

  Future<void> fetchCityName() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude.value,
        longitude.value,
      );

      if (placemarks.isNotEmpty) {
        cityName.value = placemarks[0].locality ?? "Unknown";
      } else {
        cityName.value = "Unknown";
      }
    } catch (e) {
      print(e);
      cityName.value = "Error retrieving city";
    }
  }

  double calculateDistance(double stationLat, double stationLon) {
    return Geolocator.distanceBetween(
      latitude.value,
      longitude.value,
      stationLat,
      stationLon,
    ) / 1000;
  }
}
