import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cellbazar/models/product_model.dart';
import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/widgets/components/wellbutton_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/components/backbutton_widget.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  ProductModel productModel;
  DetailScreen({super.key, required this.productModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //getting user id
  User? user = FirebaseAuth.instance.currentUser;
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
              'Product Detail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //product images
                CarouselSlider(
                  items: widget.productModel.productImages
                      .map(
                        (imageUrls) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            imageUrl: imageUrls,
                            fit: BoxFit.cover,
                            width: Get.width - 10,
                            placeholder: (context, url) => ColoredBox(
                              color: Colors.white,
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),

                ListTile(
                  title: Text(
                    widget.productModel.productName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.productModel.productCompany),
                      Text('RS:' + widget.productModel.fullPrice)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.favorite_outline,
                        size: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/images/rating.webp',
                      height: 40,
                    )
                  ],
                ),
                Divider(),

                ListTile(
                  title: Text('Description'),
                  subtitle: Text(
                    widget.productModel.productDescription,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Specifications'),
                  subtitle: Text(
                    widget.productModel.productSpec,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                WellButtonWidget(
                    ontap: () {
                      sendMessageOnWhatsApp(productModel: widget.productModel);
                    },
                    icon: Image.asset('assets/images/email_icon.png'),
                    title: 'Whatsapp',
                    color: AppConstants.appMainColor),
                WellButtonWidget(
                    ontap: () {},
                    icon: Image.asset('assets/images/email_icon.png'),
                    title: 'Add to cart',
                    color: AppConstants.favouriteIconColor)
              ]),
        ),
      ),
    );
  }

  static Future<void> sendMessageOnWhatsApp({
    required ProductModel productModel,
  }) async {
    final number = "+923410148101";
    final message =
        "Hello CellBazaar \ni want to know about this product \n______________________\n\nProduct Name: ${productModel.productName}\n\nProduct Category: ${productModel.categoryName}\n\nProduct Company: ${productModel.productCompany}\n\nProduct ID: ${productModel.productId}";

    final url = 'https://wa.me/$number?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
