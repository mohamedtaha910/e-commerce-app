import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/searched_product_item.dart';
import 'package:flutter/material.dart';

class SearchedProductsList extends StatelessWidget {
  const SearchedProductsList({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SerchedProductItem(
            product: products[index],
          );
        },
      ),
    );
  }
}
