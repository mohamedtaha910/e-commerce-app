import 'package:e_commerce_app/features/order/data/models/order_model.dart';

abstract class OrderRepo {
  Future<void> addOrder( Order order);

  // Future<void> deleteOrder( String orderId);

  List<Order> getOrders();
}