import 'package:e_commerce_app/core/models/product_model/product.dart';

abstract class CartRepo {

  bool isInCart(int id);

  void addToCart(Product product);

  List<Product> fetchAllCart();

  void incrementQuantity(Product product);

  void decrementQuantity(Product product);

  double getTotalPrice();

  

}