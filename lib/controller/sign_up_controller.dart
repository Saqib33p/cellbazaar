// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for password visibility
  var isPasswordVisible = true.obs;

// main signup future function
  Future<UserCredential?> signUpMethod(String userEmail, String userName,
      String userCity, String userPassword, String userDeviceToken) async {
    try {
      EasyLoading.show(status: "Please wait..");
      //sign in with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
// send verification email
      await userCredential.user!.sendEmailVerification();

// this method collect data for saving user data on firestore
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: '',
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity);

      //save data on firestore
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
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
