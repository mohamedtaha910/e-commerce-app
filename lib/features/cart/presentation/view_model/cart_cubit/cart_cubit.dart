// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  List<CartProduct> cartProducts = [];

  void loadCart() async {
    emit(CartLoading());

    cartProducts = await cartRepo.fetchCartItems();
    emit(CartSuccess(cartProducts: cartProducts));
  }

  void toggleCart(CartProduct product) {
    if (isInCart(product.product.id!)) {
      cartRepo.removeFromCart(product.product.id!);
      cartProducts.remove(product);
    } else {
      cartRepo.addToCart(product);
      cartProducts.add(product);
    }
    loadCart();
  }

  void incrementQuantity(CartProduct product) {
    cartRepo.increaseQuantity(product.product.id!);
    loadCart();
  }

  void decrementQuantity(CartProduct product) {
    cartRepo.decreaseQuantity(product.product.id!);
    loadCart();
  }

  double getTotalPrice() {
    double total = 0;
    for (var product in cartProducts) {
      total += product.product.price! * product.quantity;
    }
    return total;
  }

  bool isInCart(int id) =>
      cartProducts.any((product) => product.product.id == id);

  void clearCart() {
    cartRepo.clearCart();
    cartProducts = [];
    // loadCart();
    emit(CartSuccess(cartProducts: []));
  }
}
