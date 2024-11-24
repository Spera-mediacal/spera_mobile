import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var cityName = "Unknown".obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    isLoading.value = true;
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude.value = position.latitude;
      longitude.value = position.longitude;

      await fetchCityName();
    } catch (e) {
      cityName.value = "Error retrieving location";
    } finally {
      isLoading.value = false;
    }
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
      cityName.value = "Error retrieving city";
    }
  }

  double calculateDistance(double stationLat, double stationLon) {
    return Geolocator.distanceBetween(
      latitude.value,
      longitude.value,
      stationLat,
      stationLon,
    ) /
        1000;
  }
}
