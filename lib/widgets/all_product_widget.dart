import 'package:cellbazar/models/product_model.dart';
import 'package:cellbazar/utils/appconstants.dart';
import 'package:cellbazar/view/userview/detailed_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductWidget extends StatelessWidget {
  const AllProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: false)
          .get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.data != null) {
          return Container(
            height: Get.height / 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
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
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => DetailScreen(productModel: productModel));
                    },
                    child: Container(
                      width: Get.width / 3,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Stack(
                        children: [
                          Image.network(
                            productModel.productImages[0],
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
                                  color:
                                      AppConstants.appMainColor.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    productModel.productName,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: AppConstants.textColorWhite),
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
                                        'RS:' + productModel.fullPrice,
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
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
