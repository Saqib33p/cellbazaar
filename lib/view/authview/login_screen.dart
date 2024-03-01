import 'package:cellbazar/view/authview/forgot_password_screen.dart';
import 'package:cellbazar/view/authview/signup_screen.dart';
import 'package:cellbazar/view/userview/main_screen.dart';
import 'package:cellbazar/widgets/mainbutton_widget.dart';
import 'package:cellbazar/widgets/textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      color: AppConstants.textColorWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Sign in to continue',
                  style: TextStyle(
                      color: AppConstants.textColorWhite, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: AppConstants.textColorWhite),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text('Signup here'))
                ],
              ),
              SizedBox(height: Get.height / 9),
              TextFormFieldWidget(
                title: 'NAME',
                hinttext: 'Enter your name',
              ),
              TextFormFieldWidget(
                title: 'EMAIL',
                hinttext: 'Enter your name',
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ForgotPasswordScreen());
                },
                child: Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'FORGOT PASSWORD?',
                    )),
              ),
              SizedBox(height: Get.height / 9),
              MainButtonWidget(
                  ontap: () {
                    Get.to(() => MainScreen());
                  },
                  title: 'Login'),
            ],
          )),
    );
  }
}
