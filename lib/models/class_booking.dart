// ignore_for_file: public_member_api_docs, sort_constructors_first

class ClassBooking {
  final String thumbnaile;
  final String title;
  final String description;
  final double price;
  final int totalLesson;
  final TeacherInfo teacher;

  ClassBooking(
      {required this.thumbnaile,
      required this.title,
      required this.description,
      required this.price,
      required this.totalLesson,
      required this.teacher});
}

class TeacherInfo {
  final String name;
  final String category;
  final int experience;
  final String profileImage;
  TeacherInfo({
    required this.name,
    required this.category,
    required this.experience,
    required this.profileImage,
  });
}
