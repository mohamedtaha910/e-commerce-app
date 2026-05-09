import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/data/repos/order_repo.dart';
import 'package:hive/hive.dart';

class OrderRepoImplementation implements OrderRepo {
  
  final Box<Order> box = Hive.box<Order>('orders');
  @override
  Future<void> addOrder(Order order) async {
   await box.add(order);
  }

  // @override
  // Future<void> deleteOrder(String orderId) async {
  //   await box.delete(orderId);
  // }

  @override
  List<Order> getOrders() {
    return box.values.toList();
  }
}