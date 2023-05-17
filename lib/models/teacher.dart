import 'dart:convert';

import 'package:goethestudent/models/teacher_schedule.dart';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  final String name;
  final String image;
  final String phone;
  final double rating;
  final List<TeacherSchedle> teacherSchdule;

  Teacher({
    required this.name,
    required this.image,
    required this.phone,
    required this.rating,
    required this.teacherSchdule,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        rating: json["rating"]?.toDouble(),
        teacherSchdule: json["teacherSchdule"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "phone": phone,
        "rating": rating,
        "teacherSchdule": teacherSchdule,
      };
}
