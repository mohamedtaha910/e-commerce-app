import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/api_services.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, List<Product>>> searchedProductsList({
    required String query,
  }) async {
    try {
      var data = await apiService.get(endPoint: 'products/search?q=$query');
      List<Product> products = [];
      for (var product in data['products']) {
        products.add(Product.fromJson(product));
      }
      return right(products);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
