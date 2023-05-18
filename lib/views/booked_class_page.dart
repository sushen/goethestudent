import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/controllers/booking_controller.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:goethestudent/views/booking_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BookedClassPage extends StatelessWidget {
  const BookedClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingControlller = Get.put(BookingController());
    return Scaffold(
      appBar: bookingAppbar(context),
      body: Obx(() {
        return bookingControlller.classbookedList.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: bookingControlller.classbookedList.length,
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                itemBuilder: (context, index) {
                  final ourclass = bookingControlller.classbookedList[index];
                  return ClassItem(
                    ourclass: ourclass,
                    isFromBooked: true,
                  );
                })
            : Center(
                child: Text(
                  "Not Any Class Booked",
                  style: GoogleFonts.cinzel(
                      color: AppColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              );
      }),
    );
  }
}

AppBar bookingAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        height: 27,
        width: 27,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 1, color: AppColors.blackColor.withOpacity(0.2))),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
    ),
    centerTitle: true,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Our Classes",
          style: GoogleFonts.cinzel(
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Obx(() {
          return CircleAvatar(
            radius: 10,
            child: Text(
              Get.put(BookingController()).classbookedList.length.toString(),
              style: GoogleFonts.cinzel(
                  color: AppColors.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          );
        }),
      ],
    ),
  );
}
