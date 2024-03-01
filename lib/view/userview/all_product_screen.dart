import 'package:cellbazar/widgets/backbutton_widget.dart';

import 'package:flutter/material.dart';

import '../../widgets/image_card_widget_gridview.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
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
              'All product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ImageCardGridViewWidget(
              ontap: () {},
              itemname: 'Gionee Handfree',
              itemprice: '600',
              imageUrl: 'assets/images/gionee.png');
        },
      ),
    );
  }
}
