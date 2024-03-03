import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/authview/login_screen.dart';
import 'package:cellbazar/view/authview/signup_screen.dart';
import 'package:cellbazar/widgets/components/wellbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppConstants.appMainColor,
          AppConstants.appSecondaryColor,
        ])),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/splash_icon.json',
                height: Get.height / 4),
            Text(
              'Happy Shoping!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textColorWhite),
            ),
            SizedBox(
              height: Get.height / 9,
            ),
            WellButtonWidget(
                ontap: () {
                  Get.to(() => SignUpScreen());
                },
                icon: Image.asset('assets/images/google_icon.png'),
                title: 'Sign in with google'),
            WellButtonWidget(
                ontap: () {
                  Get.to(() => LoginScreen());
                },
                icon: Image.asset('assets/images/email_icon.png'),
                title: 'Sign in with email')
          ],
        ),
      ),
    );
  }
}
