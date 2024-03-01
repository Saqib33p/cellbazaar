import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/appconstants.dart';

class WellButtonWidget extends StatelessWidget {
  final String title;
  final Image icon;
  final VoidCallback ontap;
  const WellButtonWidget({
    super.key,
    required this.ontap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: Get.height / 13,
          width: Get.width / 1.3,
          decoration: BoxDecoration(
              color: AppConstants.appMainColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: TextButton.icon(
                  onPressed: ontap,
                  icon: icon,
                  label: Text(
                    title,
                    style: TextStyle(
                        color: AppConstants.textColorWhite, fontSize: 18),
                  ))),
        ),
      ),
    );
  }
}
