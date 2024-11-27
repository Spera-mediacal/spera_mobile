
class User {
  final String fullName;
  final String id;
  final String phoneNumber;
  final String bloodType;
  final int weight;
  final int height;
  final int age;

  User({
    required this.fullName,
    required this.id,
    required this.phoneNumber,
    required this.bloodType,
    required this.weight,
    required this.height,
    required this.age,
  });

  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": fullName,
      "phone": phoneNumber,
      "bloodType": bloodType,
      "weight": weight,
      "hight": height,
      "bmi": calculateBMI(),
      "age": age,
    };
  }
}