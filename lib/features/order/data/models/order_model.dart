import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:hive/hive.dart';
part 'order_model.g.dart';

@HiveType(typeId: 5)
class Order {
  @HiveField(0)
  String id;

  @HiveField(1)
  List<CartProduct> items;

  @HiveField(2)
  double total;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String city;
  @HiveField(5)
  String country;
  @HiveField(6)
  String address;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    required this.city,
    required this.country,
    required this.address
  });
}