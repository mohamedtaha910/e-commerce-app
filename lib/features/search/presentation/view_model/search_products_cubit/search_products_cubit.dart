// import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit(this.searchRepo) : super(SearchProductsInitial());
  final SearchRepo searchRepo;

  Future<void> searchProducts({required String query}) async {
    if (query.isEmpty || query.trim() == '') {
      emit(SearchProductsInitial());
      return;
    }
    emit(SearchProductsLoading());
    var result = await searchRepo.searchedProductsList(query: query);
    result.fold(
      (failure) {
        emit(SearchProductsFailure(errorMessage: failure.errorMessage));
      },
      (products) {
        emit(SearchProductsSuccess(products: products));
      },
    );
  }
}
