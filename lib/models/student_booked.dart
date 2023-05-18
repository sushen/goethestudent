// To parse this JSON data, do
//
//     final teacherSchedule = teacherScheduleFromJson(jsonString);

import 'dart:convert';

StudentBookModel teacherScheduleFromJson(String str) =>
    StudentBookModel.fromJson(json.decode(str));

String teacherScheduleToJson(StudentBookModel data) =>
    json.encode(data.toJson());

class StudentBookModel {
  final String teacherName;
  final double rating;
  final List<dynamic> classList;
  final String userName;
  final String email;
  final String uid;
  final int amount;
  final String bookedData;
  final String paymentMethod;

  StudentBookModel({
    required this.teacherName,
    required this.rating,
    required this.classList,
    required this.userName,
    required this.email,
    required this.uid,
    required this.amount,
    required this.bookedData,
    required this.paymentMethod,
  });

  factory StudentBookModel.fromJson(Map<String, dynamic> json) =>
      StudentBookModel(
        teacherName: json["teacherName"],
        rating: json["rating"],
        classList: List<dynamic>.from(json["classList"].map((x) => x)),
        userName: json["userName"],
        email: json["email"],
        uid: json["uid"],
        amount: json["amount"],
        bookedData: json["bookedData"],
        paymentMethod: json["paymentMethod"],
      );

  Map<String, dynamic> toJson() => {
        "teacherName": teacherName,
        "rating": rating,
        "classList": List<dynamic>.from(classList.map((x) => x)),
        "userName": userName,
        "email": email,
        "uid": uid,
        "amount": amount,
        "bookedData": bookedData,
        "paymentMethod": paymentMethod,
      };
}
