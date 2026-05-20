// import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';

abstract class CartRepo {

  // bool isInCart(int id);

  // void addToCart(CartProduct product);
  
  // void clearCart();

  // List<CartProduct> fetchAllCart();

  // void incrementQuantity(CartProduct product);

  // void decrementQuantity(CartProduct product);

  // double getTotalPrice();



// ------------------
Future<void> addToCart(CartProduct product);

  Future<void> removeFromCart(int productId);

  Future<void> increaseQuantity(int productId);

  Future<void> decreaseQuantity(int productId);

  Future<void> clearCart();

  Future<List<CartProduct>> fetchCartItems();
}