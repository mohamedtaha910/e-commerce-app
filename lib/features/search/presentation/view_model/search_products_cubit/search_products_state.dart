part of 'search_products_cubit.dart';

abstract class SearchProductsState {}

class SearchProductsInitial extends SearchProductsState {}

class SearchProductsLoading extends SearchProductsState {}

class SearchProductsSuccess extends SearchProductsState {
  final List<Product> products;

  SearchProductsSuccess({required this.products});
}

class SearchProductsFailure extends SearchProductsState {
  final String errorMessage;

  SearchProductsFailure({required this.errorMessage});
}
