// ignore_for_file: non_constant_identifier_names

import 'package:cellbazar/utils/appconstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// main signup future function
  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please wait..");
      //sign in with email and password
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        'Request sent successfully',
        "Password reset link sent to $userEmail",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        backgroundColor: AppConstants.appMainColor,
        colorText: Colors.white,
        borderRadius: 10.0,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeInBack,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        barBlur: 20.0,
        overlayBlur: 5.0,
        overlayColor: Colors.black.withOpacity(0.5),
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(milliseconds: 500),
      );

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10.0,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeInBack,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        barBlur: 20.0,
        overlayBlur: 5.0,
        overlayColor: Colors.black.withOpacity(0.5),
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(milliseconds: 500),
      );
    }
  }
}
