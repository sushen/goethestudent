import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goethestudent/services/auth_service.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:goethestudent/utils/custom_button.dart';
import 'package:goethestudent/views/dashboard_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO : add facebook sign-in
              CustomButton(
                // TODO : complete phone sign-in
                color: AppColors.redColor,
                textColor: AppColors.whiteColor,
                onPressed: () {},
                text: 'Sign In with phone',
              ),
              CustomButton(
                color: AppColors.whiteColor,
                textColor: AppColors.blackColor,
                onPressed: () async {
                  user = await Authentication.signInWithGoogle();
                  if (user != null) {
                    Get.off(() => const DashBoardPage());
                  }
                },
                text: 'Sign In with google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
