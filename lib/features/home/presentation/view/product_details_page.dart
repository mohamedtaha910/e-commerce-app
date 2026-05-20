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
              const SizedBox(height: 32),
              Row(
                children: [
                  RatingInfo(
                    rating: product.rating!,
                    reviews: product.reviews!.length,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: product.availabilityStatus == 'In Stock'
                          ? Colors.green.withAlpha(50)
                          : Colors.red.withAlpha(50),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      product.availabilityStatus!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: product.availabilityStatus == 'In Stock'
                            ? Colors.green
                            : Colors.pink.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              HorizintalLine(
                color: Colors.grey.shade200,
                height: 1.6,
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
                height: 1.6,
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
                height: 1.6,
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
        padding: EdgeInsets.only(right: 16, left: 16, top: 0, bottom: 16),
        decoration: BoxDecoration(
          // color: Colors.white38,
          // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shadowColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      BlocProvider.of<CartCubit>(
                        context,
                      ).addToCart(CartProduct(product: product, quantity: 1));
                    },
                    child: Text(
                      BlocProvider.of<CartCubit>(context).isInCart(product.id!)
                          ? 'Remove from Cart'
                          : 'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shadowColor: AppColors.primaryColor,
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
