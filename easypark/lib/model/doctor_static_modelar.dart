// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<DoctorModel> nearbyDoctors = [
  DoctorModel(
    name: "ناتالي سامح",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/images/doctor_1.jpg",
  ),
  DoctorModel(
    name: "سجي سعدون",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/images/doctor_2.jpg",
  ),
  DoctorModel(
    name: "سامح سمير",
    position: "General Practitioner",
    averageReview: 2,
    totalReviews: 0,
    profile: "assets/images/doctor_3.jpg",
  ),
];
