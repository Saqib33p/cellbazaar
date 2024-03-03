import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';

class MainButtonWidget extends StatelessWidget {
  final String title;

  final VoidCallback ontap;
  const MainButtonWidget({
    super.key,
    required this.ontap,
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
              child: TextButton(
                  onPressed: ontap,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: AppConstants.textColorWhite, fontSize: 18),
                  ))),
        ),
      ),
    );
  }
}
