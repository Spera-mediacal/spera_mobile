class Station {
  final int id;
  final String name;
  final String phone;
  final double lat;
  final double lon;
  final int adminId;

  Station({
    required this.id,
    required this.name,
    required this.phone,
    required this.lat,
    required this.lon,
    required this.adminId,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    List<String> locationParts = (json['location'] as String).split(',');
    double lat = double.parse(locationParts[0].trim());
    double lon = double.parse(locationParts[1].trim());

    return Station(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      lat: lat,
      lon: lon,
      adminId: json['admin_id'],
    );
  }
}