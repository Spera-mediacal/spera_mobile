class OnboardingModel {
  final String title;
  final String desc;
  final String image;

  OnboardingModel({
    required this.title,
    required this.desc,
    required this.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      title: json['title'],
      desc: json['desc'],
      image: json['image'],
    );
  }
}
