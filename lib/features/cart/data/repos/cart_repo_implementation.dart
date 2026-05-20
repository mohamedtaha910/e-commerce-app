// import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class CartRepoImplementation implements CartRepo {
  // final Box<CartProduct> box = Hive.box<CartProduct>('cartProducts');
  final FirebaseAuth auth;

  CartRepoImplementation({required this.auth});
  Box<CartProduct>? _box;

  Future<Box<CartProduct>> _getBox() async {
    if (_box != null) {
      return _box!;
    }

    final uid = auth.currentUser!.uid;

    _box = await Hive.openBox<CartProduct>('cart_$uid');

    return _box!;
  }

  @override
  Future<void> addToCart(CartProduct product) async {
    final box = await _getBox();

    await box.put(product.product.id, product);
  }

  @override
  Future<void> removeFromCart(int productId) async {
    final box = await _getBox();

    await box.delete(productId);
  }

  @override
  Future<void> increaseQuantity(int productId) async {
    final box = await _getBox();

    final product = box.get(productId);
    if (product!.quantity < product.product.stock!) {
      product.quantity++;
      box.put(product.product.id, product);
    }
  }

  @override
  Future<void> decreaseQuantity(int productId) async {
    final box = await _getBox();

    final product = box.get(productId);
    if (product!.quantity > 1) {
      product.quantity--;
      box.put(product.product.id, product);
    }
  }

  @override
  Future<void> clearCart() async {
    final box = await _getBox();

    await box.clear();
  }

  @override
  Future<List<CartProduct>> fetchCartItems() async {
    final box = await _getBox();

    return box.values.toList();
  }
}
