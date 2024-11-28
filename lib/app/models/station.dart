class Station {
  final int id;
  final String name;
  final String phone;
  final int adminId;
  final double lat;
  final double lon;

  Station({
    required this.id,
    required this.name,
    required this.phone,
    required this.adminId,
    required this.lat,
    required this.lon,
  });

  // Factory method to parse from JSON
  factory Station.fromJson(Map<String, dynamic> json) {
    final locationParts = json['location'].split('@'); // Split location into lat and lon
    return Station(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      adminId: json['admin_id'],
      lat: double.parse(locationParts[0]), // Latitude
      lon: double.parse(locationParts[1]), // Longitude
    );
  }
}
