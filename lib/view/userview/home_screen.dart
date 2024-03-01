import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/userview/all_flash_sale_screen.dart';
import 'package:cellbazar/view/userview/all_product_screen.dart';
import 'package:cellbazar/widgets/banner_widget.dart';
import 'package:cellbazar/widgets/heading_widget.dart';
import 'package:cellbazar/widgets/image_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.appMainColor),
        actions: [
          IconButton(
              onPressed: () {},
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

              Container(
                height: Get.height / 8,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.phone_android),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Phones')
                        ],
                      ),
                    );
                  },
                ),
              ),
              //flash sale heading
              HeadingWidget(
                  ontap: () {
                    Get.to(() => AllFlashSaleScreen());
                  },
                  title: 'Flash Sales'),
//products
              Container(
                height: Get.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ImageCardWidget(
                      ontap: () {},
                      itemname: 'Gionee Handfree',
                      itemprice: '500',
                      imageUrl: 'assets/images/beme.webp',
                    );
                  },
                ),
              ),
              HeadingWidget(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllProductScreen()));
                  },
                  title: 'All products'),
              Container(
                height: Get.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ImageCardWidget(
                      ontap: () {},
                      itemname: 'Gionee Handfree',
                      itemprice: '500',
                      imageUrl: 'assets/images/iphone12.png',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
