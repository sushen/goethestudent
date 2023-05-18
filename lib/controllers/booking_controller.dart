import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/models/class_booking.dart';
import 'package:goethestudent/utils/show_snackbar.dart';

class BookingController extends GetxController {
  var isExist = false.obs;
  var classbookedList = <ClassBooking>[].obs;

  void bookClass(ClassBooking classBooking, BuildContext context) {
    var data = classbookedList.where(
        (item) => item.title.toLowerCase() == classBooking.title.toLowerCase());

    if (data.isNotEmpty) {
      Navigator.of(context).pop();
      showSnackBar(context, "Already Exist");
    } else {
      classbookedList.add(classBooking);
      Navigator.of(context).pop();
      showSnackBar(context, "Class Booked Successfully");
    }
  }

  void deleteClassfromBooked(String title, BuildContext context) {
    classbookedList
        .removeWhere((item) => item.title.toLowerCase() == title.toLowerCase());

    showSnackBar(context, "Class Cancled");
  }
}
