import 'package:cellbazar/view/authview/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';
import '../../widgets/components/mainbutton_widget.dart';
import '../../widgets/components/textformfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppConstants.appMainColor,
        AppConstants.appSecondaryColor,
      ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Create New\nAccount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      color: AppConstants.textColorWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: AppConstants.textColorWhite),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(' Login here'))
                ],
              ),
              SizedBox(height: Get.height / 30),
              TextFormFieldWidget(
                title: 'NAME',
                hinttext: 'Enter your name',
              ),
              TextFormFieldWidget(
                title: 'ADRESS',
                hinttext: 'Enter your adress',
              ),
              TextFormFieldWidget(title: 'EMAIL', hinttext: 'Enter your email'),
              TextFormFieldWidget(
                  title: 'PASSWORD', hinttext: 'Enter your password'),
              SizedBox(height: Get.height / 35),
              MainButtonWidget(
                  ontap: () {
                    Get.to(() => LoginScreen());
                  },
                  title: 'Sign up'),
            ],
          )),
    );
  }
}
