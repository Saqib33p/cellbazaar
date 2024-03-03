import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appconstants.dart';

class PaymentDetailContainer extends StatelessWidget {
  final String subtotalprice, totalprice;
  const PaymentDetailContainer(
      {super.key, required this.subtotalprice, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppConstants.appMainColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Sub Total'), Text('PKR: ' + subtotalprice)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Delivery Fee'), Text('Free')],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'PKR: ' + totalprice,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
