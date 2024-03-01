import 'dart:async';

import 'package:cellbazar/utils/appconstants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'wellcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offAll(() => WellcomeScreen());
    });
  }

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
