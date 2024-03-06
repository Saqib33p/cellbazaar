// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../utils/appconstants.dart';

// class ImageCardGridViewWidget extends StatelessWidget {
//   final String itemname;
//   // final String itemprice;
//   final VoidCallback ontap;
//   final String imageUrl;
//   final String companyName;
//   const ImageCardGridViewWidget(
//       {super.key,
//       required this.ontap,
//       required this.itemname,
//       // required this.itemprice,
//       required this.imageUrl,
//       required this.companyName});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: Container(
//             width: Get.width / 3,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//             child: Stack(
//               children: [
//                 Image.asset(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   height: Get.height / 4,
//                 ),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Container(
//                       margin: EdgeInsets.only(top: 3, right: 3),
//                       child: Icon(
//                         Icons.favorite_outline,
//                         size: 30,
//                       ),
//                     )),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     height: 60,
//                     width: Get.width / 2,
//                     decoration: BoxDecoration(
//                       color: AppConstants.appMainColor.withOpacity(.6),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 4, bottom: 2),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             itemname,
//                             maxLines: 1,
//                             style:
//                                 TextStyle(color: AppConstants.textColorWhite),
//                           ),
//                           Text(
//                             companyName,
//                             style: TextStyle(
//                                 fontSize: 10,
//                                 color: AppConstants.textColorWhite),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 8),
//                             alignment: Alignment.bottomRight,
//                             child: Image.asset(
//                               'assets/images/rating.webp',
//                               height: 23,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
