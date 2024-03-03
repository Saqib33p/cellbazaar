import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../widgets/components/backbutton_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //product images
                CarouselSlider(
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
                  items: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/gionee.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/beme.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Add more items as needed
                  ],
                ),

                ListTile(
                  title: Text(
                    'Audionic handfree A40v',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Audionic'), Text('RS: 500')],
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
                    'This product is about the categories of the handfrees , its available in very chaep price in our stor This product is about the categories of the handfrees , its available in very chaep price in our stor This product is about the categories of the handfrees , its available in very chaep price in our stor This product is about the categories of the handfrees , its available in very chaep price in our stor',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Specifications'),
                  subtitle: Text(
                    'extra mic = not available\n laudness = 40 Hrz\n leangth = 13cm',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
