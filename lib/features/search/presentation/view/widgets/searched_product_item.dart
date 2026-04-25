import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/product_details_page.dart';
import 'package:flutter/material.dart';

// class SerchedProductItem extends StatelessWidget {
//   const SerchedProductItem({super.key, required this.product});
//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => ProductDetailsPage(product: product),
//           ),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//         margin: EdgeInsets.only(bottom: 16),
//         // height: 150,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.grey.shade200,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: (Offset(0, 2)),
//               blurRadius: 1,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 100,
//               width: 110,
//               child: Image.network(product.images![0]),
//             ),
//             // const SizedBox(width: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 200,
//                   child: Text(
//                     product.title!,
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),

//                 const SizedBox(height: 36),
//                 Row(
//                   // mainAxisSize: MainAxisSize.max,
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryColor.withAlpha(80),
//                         borderRadius: BorderRadius.circular(12),
//                       ),

//                       child: Row(
//                         children: [
//                           Text(
//                             '\$',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: AppColors.primaryColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             product.price.toString(),
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: MediaQuery.of(context).size.width * 0.12),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.amber.withAlpha(50),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.amber, size: 20),
//                           SizedBox(width: 5),
//                           Text(
//                             product.rating.toString(),
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ====================================
class SerchedProductItem extends StatelessWidget {
  final Product product;
  const SerchedProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double originalPrice = (product.price as num).toDouble();
    final double discount = (product.discountPercentage as num).toDouble();
    final double discountedPrice = originalPrice * (1 - discount / 100);

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        // height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        // clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            // Product Image
            SizedBox(
              width: 110,
      
              child: Image.network(
                product.images![0],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade100,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
      
            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          product.title!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        // Category badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            // color: const Color(0xFFEAF3DE),
                            color: AppColors.primaryColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          
                          child: Text(
                            product.category.toString().toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              // color: Color(0xFF3B6D11),
                              color: AppColors.primaryColor
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Brand
                        Text(
                          'by ${product.brand ?? 'Unknown Brand'}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    // Bottom section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price + Rating
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$${discountedPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '\$${originalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFCEBEB),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '-${discount.toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFA32D2D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFEF9F27),
                                  size: 13,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '${(product.rating as num).toStringAsFixed(1)}  ·  ${(product.reviews as List).length} reviews',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
      
                        // Stock + MOQ
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF639922),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  'In Stock',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF3B6D11),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Min. ${product.minimumOrderQuantity} units',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================

// class SerchedProductItem extends StatelessWidget {
//   final Product product;
//   const SerchedProductItem({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final double price = (product.price as num).toDouble();
//     final double discount = (product.discountPercentage as num).toDouble();
//     final double finalPrice = price * (1 - discount / 100);
//     final double rating = (product.rating as num).toDouble();
//     final int reviewCount = (product.reviews as List).length;
//     final bool inStock = product.availabilityStatus == 'In Stock';

//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.grey.shade100),
//       ),
//       clipBehavior: Clip.hardEdge,
//       child: Row(
//         children: [
//           // Image
//           SizedBox(
//             width: 100,
//             child: Image.network(
//               product.thumbnail!,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) =>
//                   Container(color: Colors.grey.shade50),
//             ),
//           ),

//           // Content
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Title + Favourite
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           product.title!,
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       const Icon(
//                         Icons.favorite_border_rounded,
//                         size: 16,
//                         color: Colors.black26,
//                       ),
//                     ],
//                   ),

//                   // Brand · Category
//                   Text(
//                     '${product.brand} · ${product.category}',
//                     style: const TextStyle(fontSize: 11, color: Colors.black38),
//                   ),

//                   // Price row + Rating + Stock
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Price
//                       Row(
//                         children: [
//                           Text(
//                             '\$${finalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           if (discount > 0) ...[
//                             const SizedBox(width: 5),
//                             Text(
//                               '\$${price.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 11,
//                                 color: Colors.black38,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                             const SizedBox(width: 4),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 5,
//                                 vertical: 1,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFFCEBEB),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 '${discount.toStringAsFixed(0)}% off',
//                                 style: const TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFFA32D2D),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ],
//                       ),

//                       const SizedBox(height: 4),

//                       // Rating + Stock
//                       Row(
//                         children: [
//                           // Stars
//                           Row(
//                             children: List.generate(
//                               5,
//                               (i) => Icon(
//                                 i < rating.round()
//                                     ? Icons.star_rounded
//                                     : Icons.star_outline_rounded,
//                                 size: 12,
//                                 color: i < rating.round()
//                                     ? const Color(0xFFEF9F27)
//                                     : Colors.black12,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             '${rating.toStringAsFixed(1)} ($reviewCount)',
//                             style: const TextStyle(
//                               fontSize: 11,
//                               color: Colors.black38,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             width: 5,
//                             height: 5,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: inStock
//                                   ? const Color(0xFF639922)
//                                   : Colors.grey,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             inStock ? 'In Stock' : 'Out of Stock',
//                             style: TextStyle(
//                               fontSize: 11,
//                               color: inStock
//                                   ? const Color(0xFF3B6D11)
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
