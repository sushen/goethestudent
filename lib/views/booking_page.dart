import 'package:flutter/material.dart';
import 'package:goethestudent/controllers/booking_controller.dart';
import 'package:goethestudent/models/class_booking.dart';
import 'package:goethestudent/services/local_service.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:goethestudent/views/booked_class_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<ClassBooking> classList = [];

  @override
  void initState() {
    classList = LocalService.getClassList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingAppbar(),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: classList.length,
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          itemBuilder: (context, index) {
            final ourclass = classList[index];
            return ClassItem(ourclass: ourclass);
          }),
    );
  }

  AppBar bookingAppbar() {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const BookedClassPage()));
          },
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 15, top: 20),
                child: Icon(
                  Icons.class_outlined,
                  color: AppColors.blueColor,
                  size: 28,
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: AppColors.redColor.withOpacity(0.8),
                  radius: 11,
                  child: Obx(() {
                    return Text(
                      Get.put(BookingController())
                          .classbookedList
                          .length
                          .toString(),
                      style: GoogleFonts.cinzel(
                          color: AppColors.whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ),
              ),
            ],
          ),
        )
      ],
      toolbarHeight: 75,
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our Classes",
            style: GoogleFonts.cinzel(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${classList.length} Classes",
            style: GoogleFonts.cinzel(
                color: AppColors.blueColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ClassItem extends StatelessWidget {
  const ClassItem(
      {super.key, required this.ourclass, this.isFromBooked = false});

  final ClassBooking ourclass;
  final bool? isFromBooked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: AppColors.blackColor.withOpacity(0.1))),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              ourclass.thumbnaile,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  ourclass.title,
                  maxLines: 2,
                  style: GoogleFonts.cinzel(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage:
                          NetworkImage(ourclass.teacher.profileImage),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      ourclass.teacher.name,
                      style: GoogleFonts.cinzel(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${ourclass.totalLesson} Lesson",
                      style: GoogleFonts.cinzel(
                          color: AppColors.redColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            isFromBooked == true
                                ? AppColors.redColor.withOpacity(0.8)
                                : AppColors.blueColor,
                          ),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      onPressed: () {
                        if (isFromBooked == false) {
                          detailsSheet(context);
                        } else {
                          Get.put(BookingController())
                              .deleteClassfromBooked(ourclass.title, context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: isFromBooked == true
                            ? Text(
                                "Remove",
                                style: GoogleFonts.cinzel(
                                    color: AppColors.whiteColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                "Details",
                                style: GoogleFonts.cinzel(
                                    color: AppColors.whiteColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  PersistentBottomSheetController<dynamic> detailsSheet(BuildContext context) {
    return showBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.blueColor),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor.withOpacity(0.9)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 3,
                        height: 4,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    ourclass.title,
                    style: GoogleFonts.cinzel(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // Image.network(
                  //   ourclass.thumbnaile,
                  //   width: double.infinity,
                  //   height: 120.0,
                  //   fit: BoxFit.cover,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.redColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Teacher",
                          style: GoogleFonts.cinzel(
                              color: AppColors.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(ourclass.teacher.profileImage),
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ourclass.teacher.name,
                                  style: GoogleFonts.cinzel(
                                      color: AppColors.blackColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${ourclass.teacher.category} with ${ourclass.teacher.experience} years exp.",
                                  style: GoogleFonts.cinzel(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$${ourclass.price}",
                              style: GoogleFonts.cinzel(
                                  color: AppColors.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 14.0,
                            ),
                            Text(
                              "Lesson(${ourclass.totalLesson})",
                              style: GoogleFonts.cinzel(
                                  color: AppColors.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ourclass.description,
                    style: GoogleFonts.cinzel(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              AppColors.blueColor,
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 17, right: 17),
                          child: Text(
                            "Close ",
                            style: GoogleFonts.cinzel(
                                color: AppColors.whiteColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              AppColors.redColor,
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        onPressed: () {
                          Get.put(BookingController())
                              .bookClass(ourclass, context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "Book Now",
                            style: GoogleFonts.cinzel(
                                color: AppColors.whiteColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
