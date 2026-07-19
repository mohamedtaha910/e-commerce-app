// import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class CartRepoImplementation implements CartRepo {
  // final Box<CartProduct> box = Hive.box<CartProduct>('cartProducts');
  final FirebaseAuth auth;

  CartRepoImplementation({required this.auth});
  // Box<CartProduct>? _box;

  // Future<Box<CartProduct>> _getBox() async {
  //   if (_box != null) {
  //     return _box!;
  //   }

  //   final uid = auth.currentUser!.uid;

  //   _box = await Hive.openBox<CartProduct>('cart_$uid');

  //   return _box!;
  // }
  Future<Box<CartProduct>> _openBox() async {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }
    final uid = user.uid;

    return await Hive.openBox<CartProduct>('cart_$uid');
  }

  @override
  Future<void> addToCart(CartProduct product) async {
    final box = await _openBox();

    await box.put(product.product.id, product);
  }

  @override
  Future<void> removeFromCart(int productId) async {
    final box = await _openBox();

    await box.delete(productId);
  }

  @override
  Future<void> increaseQuantity(int productId) async {
    final box = await _openBox();

    final product = box.get(productId);
    if (product!.quantity < product.product.stock!) {
      product.quantity++;
      box.put(product.product.id, product);
    }
  }

  @override
  Future<void> decreaseQuantity(int productId) async {
    final box = await _openBox();

    final product = box.get(productId);
    if (product!.quantity > 1) {
      product.quantity--;
      box.put(product.product.id, product);
    }
  }

  @override
  Future<void> clearCart() async {
    final box = await _openBox();

    await box.clear();
  }

  @override
  Future<List<CartProduct>> fetchCartItems() async {
    final box = await _openBox();

    return box.values.toList();
  }
}
