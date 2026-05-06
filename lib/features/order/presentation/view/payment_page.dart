import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.country, required this.city, required this.address, required this.totalPrice, required this.checkoutProducts});
  final String country;
  final String city;
  final String address;
  final double totalPrice ;
  final List <CartProduct> checkoutProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(child: Text('Payment Page')),
    );
  }
}
