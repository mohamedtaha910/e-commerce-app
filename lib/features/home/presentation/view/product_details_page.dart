import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_product_image.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/describtion_sectio.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_main_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/rating_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/reviews_section.dart';
import 'package:e_commerce_app/features/order/presentation/view/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: DetailsAppBar(),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(1),
        //   child: Container(height: 0.8, color: Colors.grey.shade200),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              CustomProductImage(product: product),
              const SizedBox(height: 24),
              ProductMainInfo(
                title: product.title!,
                price: product.price!,
                discountPercentage: product.discountPercentage!,
                category: product.category!,
              ),
              const SizedBox(height: 18),
              RatingInfo(
                rating: product.rating!,
                reviews: product.reviews!.length,
                availabilityStatus: product.availabilityStatus!,
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              SizedBox(height: 24),
              ProductInfo(
                stock: product.stock!,
                warrantyInfo: product.warrantyInformation!,
                shippingInfo: product.shippingInformation!,
                returnInfo: product.returnPolicy!,
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              const SizedBox(height: 24),
              DescribtionSection(
                describtion: product.description!,
                brand: product.brand ?? 'Unknown',
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1,
                horizontalMargin: 48,
                verticalMargin: 0,
                borderRadius: 12,
              ),
              const SizedBox(height: 24),
              ReviewsSection(
                reviews: product.reviews!,
                rating: product.rating!,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 16),
        decoration: BoxDecoration(
          // color: Colors.white38,
          // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      side: BorderSide(color: Colors.black12, width: 1.2),
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      BlocProvider.of<CartCubit>(
                        context,
                      ).toggleCart(CartProduct(product: product, quantity: 1));
                    },
                    child: Text(
                      BlocProvider.of<CartCubit>(context).isInCart(product.id!)
                          ? 'Remove from Cart'
                          : 'Add to Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.grey.shade900,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shadowColor: Colors.transparent,
                ),

                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) => CheckoutPage(
                        isFromCart: false,
                        totalPrice: product.price!,
                        checkoutProducts: [
                          CartProduct(product: product, quantity: 1),
                        ],
                      ),
                    ),
                  );
                },
                child: Text("Buy Now", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// import 'package:e_commerce_app/core/utils/colors.dart';
// import 'package:e_commerce_app/core/models/product_model/product.dart';
// import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
// import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_product_image.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/describtion_sectio.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/details_app_bar.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/product_info.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/product_main_info.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/rating_info.dart';
// import 'package:e_commerce_app/features/home/presentation/view/widgets/reviews_section.dart';
// import 'package:e_commerce_app/features/order/presentation/view/checkout_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({super.key, required this.product});
//   final Product product;

//   static const _kWhite  = Colors.white;
//   static const _kGray50 = Color(0xFFF9FAFB);
//   static const _kBorder = Color(0xFFE5E7EB);
//   static const _kGray900 = Color(0xFF111827);
//   static const _kGray600 = Color(0xFF4B5563);

//   // Thin horizontal divider reused between sections
//   Widget _divider() => const Divider(
//         height: 1,
//         thickness: 0.8,
//         color: Color(0xFFF3F4F6),
//         indent: 0,
//         endIndent: 0,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _kWhite,
//       appBar: AppBar(
//         backgroundColor: _kWhite,
//         surfaceTintColor: _kWhite,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1),
//           child: Container(height: 1, color: _kBorder),
//         ),
//         title: const DetailsAppBar(),
//       ),

//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),

//             // ── Product image ──────────────────────────────────────────────
//             CustomProductImage(product: product),
//             const SizedBox(height: 20),

//             // ── Title + price ──────────────────────────────────────────────
//             ProductMainInfo(
//               title: product.title!,
//               price: product.price!,
//               discountPercentage: product.discountPercentage!,
//               category: product.category!,
//             ),
//             const SizedBox(height: 16),

//             // ── Rating + stock ─────────────────────────────────────────────
//             RatingInfo(
//               rating: product.rating!,
//               reviews: product.reviews!.length,
//               availabilityStatus: product.availabilityStatus!,
//             ),
//             const SizedBox(height: 20),

//             _divider(),
//             const SizedBox(height: 20),

//             // ── Shipping / warranty / stock / return ───────────────────────
//             ProductInfo(
//               stock: product.stock!,
//               warrantyInfo: product.warrantyInformation!,
//               shippingInfo: product.shippingInformation!,
//               returnInfo: product.returnPolicy!,
//             ),
//             const SizedBox(height: 20),

//             _divider(),
//             const SizedBox(height: 20),

//             // ── Description ────────────────────────────────────────────────
//             DescribtionSection(
//               describtion: product.description!,
//               brand: product.brand ?? 'Unknown',
//             ),
//             const SizedBox(height: 20),

//             _divider(),
//             const SizedBox(height: 20),

//             // ── Reviews ────────────────────────────────────────────────────
//             ReviewsSection(
//               reviews: product.reviews!,
//               rating: product.rating!,
//             ),

//             const SizedBox(height: 8),
//           ],
//         ),
//       ),

//       // ── Bottom action bar ────────────────────────────────────────────────
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
//         decoration: BoxDecoration(
//           color: _kWhite,
//           border: Border(
//             top: BorderSide(color: _kBorder, width: 0.8),
//           ),
//         ),
//         child: Row(
//           children: [
//             // Add to Cart
//             Expanded(
//               child: BlocBuilder<CartCubit, CartState>(
//                 builder: (context, state) {
//                   final inCart = BlocProvider.of<CartCubit>(context)
//                       .isInCart(product.id!);
//                   return _ActionButton(
//                     label: inCart ? 'Remove from Cart' : 'Add to Cart',
//                     onTap: () {
//                       BlocProvider.of<CartCubit>(context).toggleCart(
//                         CartProduct(product: product, quantity: 1),
//                       );
//                     },
//                     style: _ButtonStyle.outline,
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(width: 10),

//             // Buy Now
//             Expanded(
//               child: _ActionButton(
//                 label: 'Buy Now',
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => CheckoutPage(
//                         isFromCart: false,
//                         totalPrice: product.price!,
//                         checkoutProducts: [
//                           CartProduct(product: product, quantity: 1),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 style: _ButtonStyle.filled,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ── Action button ──────────────────────────────────────────────────────────────
// enum _ButtonStyle { outline, filled }

// class _ActionButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   final _ButtonStyle style;

//   const _ActionButton({
//     required this.label,
//     required this.onTap,
//     required this.style,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isFilled = style == _ButtonStyle.filled;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: isFilled ? const Color(0xFF111827) : Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: isFilled
//                 ? const Color(0xFF111827)
//                 : const Color(0xFFE5E7EB),
//             width: 1,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: isFilled
//                   ? Colors.white
//                   : const Color(0xFF111827),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
