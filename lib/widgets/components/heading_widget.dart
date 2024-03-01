import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const HeadingWidget({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: Get.height / 25,
              width: Get.width / 4.5,
              decoration: BoxDecoration(
                color: AppConstants.appMainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                'View all',
                style: TextStyle(color: AppConstants.textColorWhite),
              )),
            ),
          )
        ],
      ),
    );
  }
}
