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
        // child: const Divider(indent: 40, endIndent: 40 ),
        child: SizedBox(height: 4,),
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            SerchedProductItem(product: products[index]),
            index == products.length - 1
                ? const SizedBox(height: 85)
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
