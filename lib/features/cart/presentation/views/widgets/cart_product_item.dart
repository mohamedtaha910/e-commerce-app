import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/product_details_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.cartproduct});
  final CartProduct cartproduct;

  @override
  Widget build(BuildContext context) {
    final Product product = cartproduct.product;
    final double discount = (product.discountPercentage as num).toDouble();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        // height: 110,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12, width: 0.6),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     offset: Offset(0, 2),
          //     blurRadius: 6,
          //   ),
          // ],
        ),

        // clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            // Product Image
            Container(
              height: 151,
              width: 125,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: Colors.grey.shade100,
              ),

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
            const SizedBox(width: 12),
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.42,
                            child: Text(
                              product.title!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  showconfirmMessage(context, cartproduct),
                              child: Icon(
                                Icons.delete,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
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
                            color: AppColors.primaryColor,
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
                  SizedBox(height: 6),
                  // Bottom section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Price + Rating
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${product.price!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),

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
                          const SizedBox(height: 10),
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

                      // qnt
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black12, width: 0.4),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<CartCubit>(
                                  context,
                                ).decrementQuantity(cartproduct);
                              },
                              child: Icon(
                                Icons.remove,
                                color: AppColors.primaryColor,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              cartproduct.quantity.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<CartCubit>(
                                  context,
                                ).incrementQuantity(cartproduct);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black38,
                                    width: 0.6,
                                  ),
                                  // borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.primaryColor,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

void showconfirmMessage(BuildContext context, CartProduct cartproduct) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(50),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.delete, color: Colors.red, size: 32),
          ),
          SizedBox(height: 16),
          Text(
            'Are you sure you want to remove this product from your cart?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                title: 'Cancel',
                onTap: () {
                  Navigator.pop(context);
                },
                verticalPadding: 4,
                // color: AppColors.primaryColor.withAlpha(50),
                color: Colors.transparent,
                textColor: AppColors.primaryColor,
                horizontalMargin: 8,
                titleSize: 14,
                isBorder: true,
              ),
              CustomButton(
                title: 'Ok',
                titleSize: 14,
                onTap: () {
                  BlocProvider.of<CartCubit>(context).toggleCart(cartproduct);
                  Navigator.pop(context);
                },
                verticalPadding: 4,
                color: Colors.red.withAlpha(50),
                textColor: Colors.red,
                horizontalMargin: 8,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
