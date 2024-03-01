import 'package:flutter/material.dart';

import '../../utils/appconstants.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback ontap;
  const BackButtonWidget({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: AppConstants.appMainColor,
            borderRadius: BorderRadius.circular(40)),
        child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppConstants.textColorWhite,
              size: 20,
            ),
            label: Text(
              'Back',
              style:
                  TextStyle(color: AppConstants.textColorWhite, fontSize: 12),
            )),
      ),
    );
  }
}
