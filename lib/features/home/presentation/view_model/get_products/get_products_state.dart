part of 'get_products_cubit.dart';

abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}
class GetProductsSuccess extends GetProductsState {
  final List<Product> products;
  GetProductsSuccess(this.products);
}
class GetProductsFailure extends GetProductsState {
  final String errorMessage;
  GetProductsFailure(this.errorMessage);
}
class GetProductsLoading extends GetProductsState {}


