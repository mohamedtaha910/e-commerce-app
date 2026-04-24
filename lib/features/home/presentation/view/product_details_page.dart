import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_product_image.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/describtion_sectio.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_main_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/rating_info.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/reviews_section.dart';
import 'package:flutter/material.dart';

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
                      color: AppColors.primaryColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      product.availabilityStatus!,
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
              ProductInfo(
                stock: product.stock!,
                warrantyInfo: product.warrantyInformation!,
                shippingInfo: product.shippingInformation!,
                returnInfo: product.returnPolicy!,
              ),
              const SizedBox(height: 24),
              HorizintalLine(),
              const SizedBox(height: 24),
              DescribtionSection(
                describtion: product.description!,
                brand: product.brand ?? 'Unknown',
              ),
              const SizedBox(height: 24),
              HorizintalLine(),
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
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          // color: Colors.white38,
          // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shadowColor: Colors.deepPurple,
                ),
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shadowColor: AppColors.primaryColor,
                ),

                onPressed: () {},
                child: Text("Buy Now", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
