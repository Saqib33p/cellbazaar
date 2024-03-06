import 'package:cellbazar/models/product_model.dart';
import 'package:cellbazar/view/userview/detailed_screen.dart';
import 'package:cellbazar/widgets/components/backbutton_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/appconstants.dart';

class AllFlashSaleScreen extends StatefulWidget {
  const AllFlashSaleScreen({super.key});

  @override
  State<AllFlashSaleScreen> createState() => _AllFlashSaleScreenState();
}

class _AllFlashSaleScreenState extends State<AllFlashSaleScreen> {
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
              'Flash sale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('products')
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }
          if (snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = snapshot.data!.docs[index];
                ProductModel productModel = ProductModel(
                  productId: productData['productId'],
                  categoryId: productData['categoryId'],
                  productName: productData['productName'],
                  categoryName: productData['categoryName'],
                  salePrice: productData['salePrice'],
                  fullPrice: productData['fullPrice'],
                  productImages: productData['productImages'],
                  deliveryTime: productData['deliveryTime'],
                  isSale: productData['isSale'],
                  productDescription: productData['productDescription'],
                  createdAt: productData['createdAt'],
                  updatedAt: productData['updatedAt'],
                  productRating: productData['productRating'],
                  productCompany: productData['productCompany'],
                  productSpec: productData['productSpec'],
                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () =>
                        Get.to(() => DetailScreen(productModel: productModel)),
                    child: Card(
                      child: Container(
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Stack(
                          children: [
                            Image.network(
                              productModel.productImages[0],
                              fit: BoxFit.cover,
                              height: Get.height / 4,
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(top: 3, right: 3),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    size: 30,
                                  ),
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 60,
                                width: Get.width / 2,
                                decoration: BoxDecoration(
                                  color:
                                      AppConstants.appMainColor.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productModel.productName,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: AppConstants.textColorWhite),
                                      ),
                                      Text(
                                        productModel.productCompany,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppConstants.textColorWhite),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                            margin: EdgeInsets.only(right: 4),
                                            height: Get.height / 32,
                                            width: Get.width / 6,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppConstants.appMainColor,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: Center(
                                              child: Text(
                                                'PKR: ' +
                                                    productModel.fullPrice,
                                                style: TextStyle(
                                                    color: AppConstants
                                                        .textColorWhite,
                                                    fontSize: 8),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
