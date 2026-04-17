import 'package:e_commerce_app/features/home/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 0.4, // 1.8
        childAspectRatio: 0.7, // 1.8
        crossAxisSpacing: 10, // x axis spacing
        mainAxisSpacing: 10, // y axis spacing
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
