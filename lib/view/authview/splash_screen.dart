import 'dart:async';

import 'package:cellbazar/utils/appconstants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/get_user_data_controller.dart';
import '../adminview/admin_main_screen.dart';
import '../userview/main_screen.dart';
import 'wellcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      dashboardManagement(context);
    });
  }

  //After ap start move to its dashboard, (Dashboard management)
//{
  Future<void> dashboardManagement(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Get.to(() => WellcomeScreen());
    }
  }

//}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Center(
              child: Lottie.asset('assets/images/splash_icon.json',
                  height: Get.height / 4),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_android,
                  size: 50,
                  color: AppConstants.appSecondaryColor,
                ),
                Text(
                  'CellBazaar',
                  style: TextStyle(
                    color: AppConstants.appMainColor,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
