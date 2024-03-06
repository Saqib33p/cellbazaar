import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/userview/all_flash_sale_screen.dart';
import 'package:cellbazar/view/userview/all_product_screen.dart';
import 'package:cellbazar/widgets/all_product_widget.dart';
import 'package:cellbazar/widgets/banner_widget.dart';
import 'package:cellbazar/widgets/category_widget.dart';
import 'package:cellbazar/widgets/components/heading_widget.dart';
import 'package:cellbazar/widgets/flash_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Cart_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appMainColor),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              icon: Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              //Banner images
              BannerWidget(),
              SizedBox(
                height: 10,
              ),

              CategoryWidget(),
              //flash sale heading
              HeadingWidget(
                  ontap: () {
                    Get.to(() => AllFlashSaleScreen());
                  },
                  title: 'Flash Sales'),
//products

              FlashSaleWidget(),

              HeadingWidget(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllProductScreen()));
                  },
                  title: 'All products'),
              AllProductWidget()
            ],
          ),
        ),
      ),
    );
  }
}
