import 'package:cellbazar/utils/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String title;
  final String hinttext;
  const TextFormFieldWidget(
      {super.key, required this.title, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: AppConstants.textColorWhite),
          ),
          SizedBox(
            height: Get.height / 100,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(color: AppConstants.textColorWhite.withOpacity(.3)),
              hintText: hinttext,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent)),
              fillColor: Colors.grey,
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
