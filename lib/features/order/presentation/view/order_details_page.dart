import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/order_product_item.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: ${order.id}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Total Price: \$${order.total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Text(
                'Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              OrderProductsList(cartProducts: order.items),
            ],
          ),
        ),
      ),
    );
  }
}

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
