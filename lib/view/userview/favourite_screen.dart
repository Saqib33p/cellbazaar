import 'package:cellbazar/utils/appconstants.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Text(
                'Favourite',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: ListView.builder(
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
                        border: Border.all(color: AppConstants.appMainColor)),
                    child: Image.asset('assets/images/beme.webp'),
                  ),
                  title: Text('Bemee handfree'),
                  subtitle: Text('RS: 500'),
                  trailing: Icon(
                    Icons.favorite,
                    color: AppConstants.favouriteIconColor,
                    size: 40,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
