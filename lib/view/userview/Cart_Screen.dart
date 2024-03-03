import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/userview/Checkout_screen.dart';
import 'package:cellbazar/widgets/components/backbutton_widget.dart';
import 'package:cellbazar/widgets/components/mainbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: BackButtonWidget(ontap: () {
            Navigator.pop(context);
          }),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Text(
                'Cart Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppConstants.appMainColor)),
                          child: Image.asset('assets/images/beme.webp'),
                        ),
                        title: Text('Bemee handfree'),
                        subtitle: Row(
                          children: [
                            Text('RS: 500'),
                            SizedBox(
                              width: Get.width / 14,
                            ),
                            IconButton.filled(
                                focusColor: AppConstants.appMainColor,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: AppConstants.textColorWhite,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton.filled(
                                focusColor: AppConstants.appMainColor,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: AppConstants.textColorWhite,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            MainButtonWidget(
                ontap: () {
                  Get.to(() => CheckoutScreen());
                },
                title: 'CHECKOUT')
          ],
        ));
  }
}
