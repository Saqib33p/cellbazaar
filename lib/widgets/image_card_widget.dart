import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/appconstants.dart';

class ImageCardWidget extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final VoidCallback ontap;
  final String imageUrl;
  const ImageCardWidget(
      {super.key,
      required this.ontap,
      required this.itemname,
      required this.itemprice,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            width: Get.width / 3,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: Get.height / 4,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                        color: AppConstants.appMainColor.withOpacity(.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Text(
                          itemname,
                          maxLines: 1,
                          style: TextStyle(color: AppConstants.textColorWhite),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 25,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppConstants.appMainColor),
                          child: Center(
                              child: Container(
                            margin: EdgeInsets.all(4),
                            child: Text(
                              'RS:' + itemprice,
                              style: TextStyle(
                                  color: AppConstants.textColorWhite,
                                  fontSize: 12),
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
