import 'package:cellbazar/view/authview/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/get_device_token_controller.dart';
import '../../controller/sign_up_controller.dart';
import '../../utils/appconstants.dart';
import '../../widgets/components/mainbutton_widget.dart';
import '../../widgets/components/textformfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //there we initilize get device token controller

  final GetDeviceTokenController getDeviceTokenController =
      Get.put(GetDeviceTokenController());

  //signup main controller
  final SignUpController signUpController = Get.put(SignUpController());

  final _formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController adresscontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
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
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        keyboardType: TextInputType.name,
                        controller: namecontroller,
                        obsecure: false,
                        suffix: false,
                        title: 'NAME',
                        hinttext: 'Enter your name',
                      ),
                      TextFormFieldWidget(
                        keyboardType: TextInputType.streetAddress,
                        controller: adresscontroller,
                        obsecure: false,
                        suffix: false,
                        title: 'ADRESS',
                        hinttext: 'Enter your adress',
                      ),
                      TextFormFieldWidget(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          obsecure: false,
                          suffix: false,
                          title: 'EMAIL',
                          hinttext: 'Enter your email'),
                      TextFormFieldWidget(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordcontroller,
                        obsecure: false,
                        suffix: false,
                        title: 'PASSWORD',
                        hinttext: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height / 35),
                MainButtonWidget(
                    ontap: () async {
                      String name = namecontroller.text.trim();
                      String adress = adresscontroller.text.trim();
                      String email = emailcontroller.text.trim();
                      String password = passwordcontroller.text.trim();
                      String userdevicetoken =
                          getDeviceTokenController.deviceToken.toString();
                      if (_formkey.currentState!.validate()) {
                        UserCredential? userCredential =
                            await signUpController.signUpMethod(
                                email, name, adress, password, userdevicetoken);
                        if (userCredential != null) {
                          Get.snackbar(
                            'Email Verification',
                            'Verification email successfully sent to your email',
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(seconds: 3),
                            backgroundColor: AppConstants.appMainColor,
                            colorText: Colors.white,
                            borderRadius: 10.0,
                            isDismissible: true,
                            forwardAnimationCurve: Curves.easeOutBack,
                            reverseAnimationCurve: Curves.easeInBack,
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            barBlur: 20.0,
                            overlayBlur: 5.0,
                            overlayColor: Colors.black.withOpacity(0.5),
                            snackStyle: SnackStyle.FLOATING,
                            animationDuration: Duration(milliseconds: 500),
                          );
                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => LoginScreen());
                        }
                      }
                    },
                    title: 'Sign up'),
              ],
            ),
          )),
    );
  }
}
