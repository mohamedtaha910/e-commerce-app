import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/data/repos/order_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class OrderRepoImplementation implements OrderRepo {
  final FirebaseAuth auth;
  Box<Order>? _box;
  String? _currentUid;

  Future<Box<Order>> _getBox() async {
    if (_box != null && _currentUid == auth.currentUser!.uid) {
      return _box!;
    }

    _currentUid = auth.currentUser!.uid;

    final user = auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    _box = await Hive.openBox<Order>('orders_${user.uid}');

    return _box!;
  }

  OrderRepoImplementation({required this.auth});
  @override
  Future<void> addOrder(Order order) async {
    final box = await _getBox();
    await box.add(order);
  }

  // @override
  // Future<void> deleteOrder(String orderId) async {
  //   await box.delete(orderId);
  // }

  @override
  Future<List<Order>> getOrders() async {
    final box = await _getBox();
    return box.values.toList();
  }
}
