// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  void loadCart() {
    // emit(CartLoading());

    List<CartProduct> products = cartRepo.fetchAllCart();
    emit(CartSuccess(cartProducts: products));
  }

  void addToCart(CartProduct product) {
    cartRepo.addToCart(product);
    loadCart();
  }

  void incrementQuantity(CartProduct product) {
    cartRepo.incrementQuantity(product);
    loadCart();
  }

  void decrementQuantity(CartProduct product) {
    cartRepo.decrementQuantity(product);
    loadCart();
  }

  double getTotalPrice() => cartRepo.getTotalPrice();

  bool isInCart(int id) => cartRepo.isInCart(id);

  void clearCart() {
    cartRepo.clearCart();
    // loadCart();
    emit(CartSuccess(cartProducts: []));
  }
}
