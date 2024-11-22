
class DoctorModel {
  final int id;
  final String name;
  final String address;
  final String image;
  final String phone;
  final String specialization;
  final String startHour;
  final String endHour;
  final String joinDate;
  final List<String> workDays;
  final double rate;

  DoctorModel({
    required this.id,
    required this.name,
    required this.address,
    required this.image,
    required this.phone,
    required this.specialization,
    required this.startHour,
    required this.endHour,
    required this.joinDate,
    required this.workDays,
    required this.rate,
  });
}

 final List<DoctorModel> dummyDoctors = List.generate(
  10,
      (index) => DoctorModel(
    id: index + 1,
    name: 'Dr. John Doe ${index + 1}',
    address: '123 Street, City ${index + 1}',
    image: 'assets/images/doctor_${index + 1}.png',
    phone: '123-456-789${index + 1}',
    specialization: 'Specialist ${index + 1}',
    startHour: '9:00 AM',
    endHour: '5:00 PM',
    joinDate: '2022-01-${index + 1}',
    workDays: ['MO', 'TU', 'FR'],
    rate: 4.5 + (index % 5) * 0.1,
  ),
);
