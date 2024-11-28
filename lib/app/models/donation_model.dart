class DonationModel {
  final int id;
  final int quantity;
  final String userId;
  final String date;

  DonationModel({
    required this.id,
    required this.quantity,
    required this.userId,
    required this.date,
  });

  // Factory constructor to create an instance from JSON
  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      id: json['id'],
      quantity: json['quantity'],
      userId: json['user_id'],
      date: json['date'],
    );
  }
}
