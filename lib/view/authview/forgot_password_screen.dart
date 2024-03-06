import 'package:cellbazar/view/authview/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/forgot_password_controller.dart';
import '../../utils/appconstants.dart';
import '../../widgets/components/mainbutton_widget.dart';
import '../../widgets/components/textformfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //forgot password initilized
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
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
              Form(
                key: _formkey,
                child: TextFormFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    obsecure: false,
                    suffix: false,
                    title: 'EMAIL',
                    hinttext: 'Enter your email'),
              ),
              SizedBox(height: Get.height / 25),
              MainButtonWidget(
                  ontap: () async {
                    if (_formkey.currentState!.validate()) {
                      String email = emailcontroller.text.trim();
                      forgetPasswordController.ForgetPasswordMethod(email);
                      Get.to(() => LoginScreen());
                    }
                  },
                  title: 'Get Link'),
            ],
          )),
    );
  }
}
