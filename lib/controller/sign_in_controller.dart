// ignore_for_file: body_might_complete_normally_nullable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for password visibility
  var isPasswordVisible = true.obs;

// main signup future function
  Future<UserCredential?> signInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: "Please wait..");
      //sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      EasyLoading.dismiss();
      return userCredential;
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
