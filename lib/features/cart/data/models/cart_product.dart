import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:hive/hive.dart';


part 'cart_product.g.dart';

@HiveType(typeId: 4)
class CartProduct {
  @HiveField(0)
  Product product;

  @HiveField(1)
  int quantity;

  CartProduct({
    required this.product,
    this.quantity = 1,
  });
}