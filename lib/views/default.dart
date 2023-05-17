import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/controllers/pyemen_controller.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  List<dynamic> paymentTypeList = [
    {
      "title": "Bkash",
      "image": "assets/icon/icon.png",
    },
    {
      "title": "Nagad",
      "image": "assets/icon/icon.png",
    },
    {
      "title": "Rocket",
      "image": "assets/icon/icon.png",
    },
  ];
  String selectedTitle = "none";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                PaymentItem(
                  title: paymentTypeList[0]['title'],
                  image: paymentTypeList[0]['image'],
                  tap: () {
                    selectedTitle = paymentTypeList[0]['title'];
                    setState(() {});
                  },
                  selectedTitle: selectedTitle,
                ),
                PaymentItem(
                  title: paymentTypeList[1]['title'],
                  image: paymentTypeList[1]['image'],
                  tap: () {
                    selectedTitle = paymentTypeList[1]['title'];
                    setState(() {});
                  },
                  selectedTitle: selectedTitle,
                ),
                PaymentItem(
                  title: paymentTypeList[2]['title'],
                  image: paymentTypeList[2]['image'],
                  tap: () {
                    selectedTitle = paymentTypeList[2]['title'];
                    setState(() {});
                  },
                  selectedTitle: selectedTitle,
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
                onPressed: () {},
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
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.title,
    required this.image,
    required this.tap,
    required this.selectedTitle,
  });
  final String title;
  final String image;
  final GestureTapCallback tap;
  final String selectedTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Column(
        children: [
          Obx(() {
            return Container(
              padding: const EdgeInsets.all(5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Get.put(PaymentController()).selectedTitle.value ==
                            title
                        ? Colors.orange
                        : AppColors.whiteColor),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            );
          }),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: GoogleFonts.cinzel(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
