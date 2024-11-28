import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/constants.dart';
import '../models/station.dart';

class LocationController extends GetxController {
  // Location-related observables
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var cityName = "Unknown".obs;
  var isLoading = true.obs;

  // Station-related observables
  var stations = <Station>[].obs; // List of Station objects
  final Dio _dio = Dio(); // For API requests

  @override
  void onInit() {
    super.onInit();
    initializeLocation(); // Initialize user location
    fetchStations(); // Fetch station data from API
  }

  // Initialize user location
  Future<void> initializeLocation() async {
    isLoading.value = true;

    try {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      await fetchCityName(); // Get the city name
    } catch (e) {
      cityName.value = "Error retrieving location";
      print(e);
    }

    isLoading.value = false;
  }

  // Check location permission
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

  // Fetch city name based on coordinates
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

  // Calculate distance between user and station
  double calculateDistance(double stationLat, double stationLon) {
    return Geolocator.distanceBetween(
      latitude.value,
      longitude.value,
      stationLat,
      stationLon,
    ) / 1000; // Convert to kilometers
  }

  // Fetch station data from the API
  Future<void> fetchStations() async {
    try {
      isLoading.value = true;

      // Make the API call
      final response = await _dio.get('http://${Constants.localIP}/api/station');
      final data = response.data['message'] as List;

      // Map the response data to Station objects
      stations.value = data.map((json) => Station.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching stations: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
