import 'package:goethestudent/models/teacher.dart';

class TeacherSchedle {
  final String char;
  final bool isNotAvailable;
  bool isSelected;

  TeacherSchedle(
      {required this.char,
      required this.isNotAvailable,
      required this.isSelected});
}
