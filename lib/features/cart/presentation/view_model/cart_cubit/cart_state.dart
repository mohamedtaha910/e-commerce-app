part of 'cart_cubit.dart';


abstract class CartState {}

class CartInitial extends CartState {}
class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});
}
class CartSuccess extends CartState {
  final List<CartProduct> cartProducts;

  CartSuccess({required this.cartProducts});
}
class CartLoading extends CartState {}


