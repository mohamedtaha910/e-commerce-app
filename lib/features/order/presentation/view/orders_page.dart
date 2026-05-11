import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view/order_details_page.dart';
import 'package:e_commerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    BlocProvider.of<OrderCubit>(context).getOrders();
    super.initState();
  }

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
              'My Orders',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderSuccess) {
            final orders = state.orders;
            if (orders.isEmpty) {
              return const Center(
                child: Text(
                  'No orders found.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => OrderDetailsPage(order: order),
                      ),
                    );
                  },
                  child: OrderItem(order: order),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'Failed to load orders.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
      ),
      child: Row(
        children: [
          Container(
            // width: 60,
            // height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(50),
              borderRadius: BorderRadius.circular(12),
              // shape: BoxShape.circle,
              // border: Border.all(color: Colors.green.shade700, width: 0.8),
            ),
            child: Icon(CupertinoIcons.cart_fill, color: Colors.blue),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #${order.id.length < 12 ? order.id : '${order.id.substring(0, 12)}...'}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Total: \$${order.total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${order.items.length} items',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),

            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}
