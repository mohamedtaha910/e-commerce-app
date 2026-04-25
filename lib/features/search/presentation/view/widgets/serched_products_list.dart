import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/searched_product_item.dart';
import 'package:flutter/material.dart';

class SearchedProductsList extends StatelessWidget {
  const SearchedProductsList({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Divider(
          indent: 32,
          endIndent: 32,
        ),
      ),
      itemBuilder: (context, index) {
        return SerchedProductItem(
          product: products[index],
        );
      },
    );
  }
}
