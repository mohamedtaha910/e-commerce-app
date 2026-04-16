import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_product_image.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_main_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/rating_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: DetailsAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProductImage(imagePath: 'assets/images/test1.png'),
            const SizedBox(height: 24),
            ProductMainInfo(),
            const SizedBox(height: 24),
            Row(
              children: [
                RatingInfo(),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "in stock",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            HorizintalLine(),
            SizedBox(height: 24),
            ProductInfo(),
          ],
        ),
      ),
    );
  }
}




// =========================================================================================
// import 'package:flutter/material.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({super.key});


  

//   @override
//   Widget build(BuildContext context) {
//     List<String> tags = ['New Arrival', 'Best Seller',];
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Stack(
//         children: [
//           /// 🔥 Image Header
//           // Hero(
//           //   tag: product['id'],
//           //   child:
//           //       Image.asset('assets/images/test1.png', height: 350, fit: BoxFit.cover), 

//           // ),
//           Image.asset('assets/images/test1.png', height: 350, fit: BoxFit.cover),

//           /// Back Button
//           Positioned(
//             top: 40,
//             left: 16,
//             child: CircleAvatar(
//               backgroundColor: Colors.black54,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ),

//           /// ❤️ Favorite
//           Positioned(
//             top: 40,
//             right: 16,
//             child: CircleAvatar(
//               backgroundColor: Colors.black54,
//               child: Icon(Icons.favorite_border, color: Colors.white),
//             ),
//           ),

//           /// 📦 Details Sheet
//           DraggableScrollableSheet(
//             initialChildSize: 0.6,
//             maxChildSize: 0.9,
//             minChildSize: 0.5,
//             builder: (context, controller) {
//               return Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.vertical(top: Radius.circular(30)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                     ),
//                   ],
//                 ),
//                 child: ListView(
//                   controller: controller,
//                   children: [
//                     /// Drag Indicator
//                     Center(
//                       child: Container(
//                         height: 5,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),

//                     /// 🏷️ Title
//                     Text(
//                       "Black Black Challenge Shoes",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     /// Brand
//                     Text(
//                       "by Black Challenge",
//                       style: TextStyle(color: Colors.grey),
//                     ),

//                     SizedBox(height: 10),

//                     /// ⭐ Rating
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber),
//                         SizedBox(width: 5),
//                         Text("4.5"),
//                         SizedBox(width: 10),
//                         Text(
//                           "(120 reviews)",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 16),

//                     /// 💰 Price
//                     Row(
//                       children: [
//                         Text(
//                           "\$199.99",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           "20% OFF",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 16),

//                     /// 📄 Description
//                     Text(
//                       "Experience the perfect blend of style and comfort with these sleek black shoes. Designed for both casual and formal occasions, they are sure to elevate your look.",
//                       style: TextStyle(color: Colors.black87),
//                     ),

//                     SizedBox(height: 16),

//                     /// 🧩 Tags
//                     Wrap(
//                       spacing: 8,
//                       children: List.generate(
//                         tags.length,
//                         (index) => Chip(
//                           label: Text(tags[index]),
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 16),

//                     /// 📦 Info
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _infoCard("Stock", "10"),
//                         _infoCard("Weight", "500g"),
//                         _infoCard(
//                           "Size",
//                           "42cm",
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 16),

//                     /// 🚚 Shipping
//                     Row(
//                       children: [
//                         Icon(Icons.local_shipping),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Text("Free shipping on orders over \$50"),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 8),

//                     /// 🛡 Warranty
//                     Row(
//                       children: [
//                         Icon(Icons.verified),
//                         SizedBox(width: 8),
//                         Text("1 Year Warranty"),
//                       ],
//                     ),

//                     SizedBox(height: 20),

//                     /// 💬 Reviews
//                     Text(
//                       "Reviews",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),

//                     SizedBox(height: 10),

//                     // ...List.generate(
//                     //   product['reviews'].length,
//                     //   (index) {
//                     //     var review = product['reviews'][index];
//                     //     return ListTile(
//                     //       leading: CircleAvatar(child: Icon(Icons.person)),
//                     //       title: Text(review['reviewerName']),
//                     //       subtitle: Text(review['comment']),
//                     //       trailing: Row(
//                     //         mainAxisSize: MainAxisSize.min,
//                     //         children: [
//                     //           Icon(Icons.star, color: Colors.amber, size: 16),
//                     //           Text("${review['rating']}"),
//                     //         ],
//                     //       ),
//                     //     );
//                     //   },
//                     // ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),

//       /// 🛒 Bottom Bar
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 10),
//         ]),
//         child: Row(
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//                 onPressed: () {},
//                 child: Text("Add to Cart"),
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//                 onPressed: () {},
//                 child: Text("Buy Now"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _infoCard(String title, String value) {
//     return Column(
//       children: [
//         Text(value,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//         SizedBox(height: 4),
//         Text(title, style: TextStyle(color: Colors.grey)),
//       ],
//     );
//   }
// }