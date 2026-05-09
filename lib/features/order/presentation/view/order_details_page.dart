import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/serched_products_list.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchedProductsList(
          products: order.items.map((e) => e.product).toList(),
        ),
      ),
    );
  }
}
