import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/order_product_item.dart';
import 'package:flutter/material.dart';

class OrderProductsList extends StatelessWidget {
  const OrderProductsList({super.key, required this.cartProducts});
  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    List<Product> products = cartProducts.map((e) => e.product).toList();
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        // child: const Divider(indent: 40, endIndent: 40 ),
        child: SizedBox(height: 4),
      ),
      itemBuilder: (context, index) {
        return OrderProductItem(cartproduct: cartProducts[index]);
      },
    );
  }
}