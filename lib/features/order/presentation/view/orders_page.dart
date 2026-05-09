import 'package:e_commerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderSuccess) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              final order = state.orders[index];

              return ListTile(
                title: Text("Order #${order.id}"),

                subtitle: Text("\$${order.total}"),
              );
            },
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
