import 'package:flutter/material.dart';
import 'package:goethestudent/utils/colors.dart';
import 'package:goethestudent/utils/custom_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: AppColors.redColor,
                textColor: AppColors.whiteColor,
                onPressed: () {},
                text: 'Sign In with phone',
              ),
              CustomButton(
                color: AppColors.whiteColor,
                textColor: AppColors.blackColor,
                onPressed: () {},
                text: 'Sign In with google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
