import 'package:cellbazar/view/authview/forgot_password_screen.dart';
import 'package:cellbazar/view/authview/signup_screen.dart';
import 'package:cellbazar/view/userview/main_screen.dart';
import 'package:cellbazar/widgets/components/mainbutton_widget.dart';
import 'package:cellbazar/widgets/components/textformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_user_data_controller.dart';
import '../../controller/sign_in_controller.dart';
import '../../utils/appconstants.dart';
import '../adminview/admin_main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//initilize get user data controller  (check admin or user)
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  //signin controller initilizing

  final SignInController signInController = Get.put(SignInController());

  final _formkey = GlobalKey<FormState>();

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
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        obsecure: false,
                        suffix: false,
                        title: 'Email',
                        hinttext: 'Enter your email',
                      ),
                      TextFormFieldWidget(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordcontroller,
                        obsecure: false,
                        suffix: false,
                        title: 'Password',
                        hinttext: 'Enter your password',
                      ),
                    ],
                  ),
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
                    ontap: () async {
                      String email = emailcontroller.text.trim();
                      String password = passwordcontroller.text.trim();
                      if (_formkey.currentState!.validate()) {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);
                        //get user uid from user credential (check admin or user start)
                        //{
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            //get user uid from user credential (check admin or user start)
                            //{
                            if (userData[0]['isAdmin'] == true) {
                              Get.offAll(() => AdminMainScreen());
                              Get.snackbar(
                                'Login Success',
                                'Wellcome to admin panel'.toString(),
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
                            } else {
                              Get.offAll(() => MainScreen());
                              Get.snackbar(
                                'Login Success',
                                'Wellcome to CellBazaar'.toString(),
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
                            }
                            //}
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please verify your email before login'
                                  .toString(),
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
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
                          }
                        }
                        // Get.to(() => MainScreen());
                      }
                    },
                    title: 'Login'),
              ],
            ),
          )),
    );
  }
}
