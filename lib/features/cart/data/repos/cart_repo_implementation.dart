// import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:hive/hive.dart';

class CartRepoImplementation implements CartRepo {
  final Box<CartProduct> box = Hive.box<CartProduct>('cartProducts');

  @override
  void addToCart(CartProduct product) {
    if (isInCart(product.product.id!)) {
      box.delete(product.product.id);
    } else {
      box.put(product.product.id, product);
    }
  }

  @override
  void decrementQuantity(CartProduct product) {
    if (product.quantity > 1) {
      product.quantity--;
    }
  }

  @override
  void incrementQuantity(CartProduct product) {
    if (product.quantity < product.product.stock!) {
      product.quantity++;
    }
  }

  @override
  List<CartProduct> fetchAllCart() {
    List<CartProduct> favourites = [];
    for (var item in box.values) {
      favourites.add(item);
    }
    return favourites;
  }

  @override
  double getTotalPrice() {
    double total = 0;
    for (var item in box.values) {
      total += item.product.price! * item.quantity;
    }
    return total;
  }

  @override
  bool isInCart(int id) => box.containsKey(id);

  @override
  void clearCart() {
    box.clear();
  }
}
