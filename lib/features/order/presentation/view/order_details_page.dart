import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/adress_info.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/id_info.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/order_products_list.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/total_price_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 6,
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 0.4),
                ),
                child: Icon(Icons.arrow_back_ios, size: 18),
              ),
            ),
            SizedBox(width: 16),
            Text(
              'Order Details',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Order ID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              IdInfo(id: order.id),
              SizedBox(height: 24),
              Text(
                'Total Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TotalPriceInfo(total: order.total),
              SizedBox(height: 24),
              Text(
                'Shipping Address ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              AdressInfo(
                address: order.address,
                city: order.city,
                country: order.country,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Items',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '${order.items.length} ${order.items.length > 1 ? 'Products' : 'Product'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              OrderProductsList(cartProducts: order.items),
              SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
