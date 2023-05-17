// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/controllers/pyemen_controller.dart';
import 'package:goethestudent/controllers/student_controller.dart';
import 'package:goethestudent/models/student_booked.dart';
import 'package:goethestudent/services/user_service.dart';
import 'package:goethestudent/views/default.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:goethestudent/controllers/schedule_controller.dart';
import 'package:goethestudent/models/teacher.dart';
import 'package:goethestudent/models/teacher_schedule.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:goethestudent/utils/show_snackbar.dart';

class TeacherSchedulePage extends StatefulWidget {
  const TeacherSchedulePage({
    Key? key,
    required this.teacher,
  }) : super(key: key);
  final Teacher teacher;

  @override
  State<TeacherSchedulePage> createState() => _TeacherSchedulePageState();
}

class _TeacherSchedulePageState extends State<TeacherSchedulePage> {
  List<dynamic> paymentTypeList = [
    {
      "title": "Bkash",
      "image": "assets/images/bkash.png",
    },
    {
      "title": "Nagad",
      "image": "assets/images/nagad.png",
    },
    {
      "title": "Rocket",
      "image": "assets/images/rocket.png",
    },
  ];
  String selectedTitle = "none";
  @override
  void initState() {
    Get.put(StudentController()).teacherName.value = widget.teacher.name;
    Get.put(StudentController()).rating.value = widget.teacher.rating;
    Get.put(StudentController()).amount.value = 3000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingAppbar(context, widget.teacher),
      body: Column(
        children: [
          SchedulaView(teacher: widget.teacher),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Available(
                color: AppColors.redColor,
                title: "Not Available",
                icon: Icons.close,
              ),
              Available(
                color: AppColors.blackColor.withOpacity(0.2),
                title: "Available",
                icon: Icons.check,
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      AppColors.greenColor,
                    ),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
                onPressed: () {
                  paymentSheet(context);
                },
                child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Payment",
                      style: GoogleFonts.cinzel(
                          color: AppColors.whiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Future<dynamic> paymentSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.purple, Colors.blue])),
            width: double.infinity,
            height: 235,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 80,
                  child: Divider(
                    thickness: 2.5,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'Choose Payment Type',
                  style: GoogleFonts.cinzel(
                      color: Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PaymentItem(
                        title: paymentTypeList[0]['title'],
                        image: paymentTypeList[0]['image'],
                        tap: () {
                          Get.put(PaymentController()).selectedTitle.value =
                              paymentTypeList[0]['title'];

                          Get.put(StudentController()).method.value =
                              paymentTypeList[0]['title'];
                        },
                        selectedTitle:
                            Get.put(PaymentController()).selectedTitle.value,
                      ),
                      PaymentItem(
                        title: paymentTypeList[1]['title'],
                        image: paymentTypeList[1]['image'],
                        tap: () {
                          Get.put(PaymentController()).selectedTitle.value =
                              paymentTypeList[1]['title'];

                          Get.put(StudentController()).method.value =
                              paymentTypeList[1]['title'];
                        },
                        selectedTitle:
                            Get.put(PaymentController()).selectedTitle.value,
                      ),
                      PaymentItem(
                        title: paymentTypeList[2]['title'],
                        image: paymentTypeList[2]['image'],
                        tap: () {
                          Get.put(PaymentController()).selectedTitle.value =
                              paymentTypeList[2]['title'];
                          Get.put(StudentController()).method.value =
                              paymentTypeList[2]['title'];
                        },
                        selectedTitle:
                            Get.put(PaymentController()).selectedTitle.value,
                      ),
                    ]),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.blueColor,
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.pop(context);
                    final snackBar = SnackBar(
                      duration: Duration(hours: 1),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Class Booking.."),
                          CircularProgressIndicator()
                        ],
                      ),
                      backgroundColor: (Colors.green),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    var info = Get.put(StudentController());

                    // showSnackBar(context, "Successfully Payment");
                    var data = UserService().bookedStudentClass(
                        StudentBookModel(
                            teacherName: info.teacherName.value,
                            rating: info.rating.value,
                            classList: info.classList,
                            userName: info.userName.value,
                            email: info.email.value,
                            uid: info.uid.value,
                            amount: info.amount.value,
                            bookedData: "not need",
                            paymentMethod: info.method.value),
                        context);
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Pay Now",
                        style: GoogleFonts.cinzel(
                            color: AppColors.whiteColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          );
        });
  }
}

class SchedulaView extends StatefulWidget {
  const SchedulaView({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  final Teacher teacher;

  @override
  State<SchedulaView> createState() => _SchedulaViewState();
}

class _SchedulaViewState extends State<SchedulaView> {
  bool checkBox = false;
  final ScheduleController scheduleController = Get.put(ScheduleController());

  Color getColor(int index) {
    return widget.teacher.teacherSchdule[index].isSelected &&
            widget.teacher.teacherSchdule[index].isNotAvailable == false
        ? AppColors.blueColor
        : widget.teacher.teacherSchdule[index].isNotAvailable == true
            ? AppColors.redColor
            : AppColors.blackColor.withOpacity(0.2);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: widget.teacher.teacherSchdule.length,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 120),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: widget.teacher.teacherSchdule[index].isNotAvailable
                  ? () {
                      showSnackBar(context, "Sorry! Not Available Yet");
                    }
                  : () {
                      if (widget.teacher.teacherSchdule[index].isSelected) {
                        showSnackBar(context, "Successfully Romoved");
                        widget.teacher.teacherSchdule[index].isSelected = false;
                        List<dynamic> classList = [];
                        classList.add(
                            {"no": widget.teacher.teacherSchdule[index].char});

                        Get.put(StudentController()).classList.value =
                            classList;
                      } else {
                        showSnackBar(context, "Successfully Added");
                        widget.teacher.teacherSchdule[index].isSelected = true;
                      }

                      setState(() {});
                    },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      // gradient: const LinearGradient(
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight,
                      //     colors: [Colors.purple, Colors.blue]),
                      border: Border.all(
                        color: getColor(index),
                        width: widget.teacher.teacherSchdule[index].isSelected
                            ? 3
                            : 2.0,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Image.asset(
                          'assets/images/room.png',
                          height: 60,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          width: double.infinity,
                          color: widget.teacher.teacherSchdule[index]
                                      .isNotAvailable ==
                                  false
                              ? AppColors.blackColor.withOpacity(0.2)
                              : AppColors.blackColor.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.teacher.teacherSchdule[index].char,
                                style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 5,
                                          color: AppColors.whiteColor),
                                      color: AppColors.whiteColor,
                                      shape: BoxShape.circle),
                                  child: widget.teacher.teacherSchdule[index]
                                              .isNotAvailable ==
                                          true
                                      ? const Icon(
                                          size: 20,
                                          Icons.close,
                                          color: AppColors.redColor,
                                        )
                                      : Icon(
                                          size: 20,
                                          Icons.check_outlined,
                                          color: widget
                                                  .teacher
                                                  .teacherSchdule[index]
                                                  .isSelected
                                              ? AppColors.blueColor
                                              : AppColors.blackColor
                                                  .withOpacity(0.4),
                                        ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Available extends StatelessWidget {
  const Available({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.whiteColor),
                color: color,
                shape: BoxShape.circle),
            child: Icon(
              size: 20,
              icon,
              color: AppColors.whiteColor,
            )),
        const SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: GoogleFonts.cinzel(
              color: Colors.black,
              letterSpacing: 0,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

AppBar bookingAppbar(BuildContext context, Teacher teacher) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: 75,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: AppColors.blackColor.withOpacity(0.6),
          ),
        ),
      ),
    ),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(teacher.image),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacher.name,
              style: GoogleFonts.cinzel(
                  color: AppColors.blackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Rating ${teacher.rating.toString()}",
              style: GoogleFonts.cinzel(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    ),
  );
}
