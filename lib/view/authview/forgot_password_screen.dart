import 'package:cellbazar/view/authview/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';
import '../../widgets/mainbutton_widget.dart';
import '../../widgets/textformfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                  'Reset Your\nPassword',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      color: AppConstants.textColorWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height / 20),
              TextFormFieldWidget(title: 'EMAIL', hinttext: 'Enter your email'),
              SizedBox(height: Get.height / 25),
              MainButtonWidget(
                  ontap: () {
                    Get.to(() => LoginScreen());
                  },
                  title: 'Get Link'),
            ],
          )),
    );
  }
}
