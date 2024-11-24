class Reminder {
  final int? id;
  final String name;
  final String details;
  final String time;

  Reminder({
    this.id,
    required this.name,
    required this.details,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'time': time,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      time: map['time'],
    );
  }
}
