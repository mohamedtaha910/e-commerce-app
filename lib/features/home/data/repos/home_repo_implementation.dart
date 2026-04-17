import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utils/api_services.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      var data = await apiService.get(endPoint: 'products/category-list');
      List<String> categories = ['All'];
      categories.addAll(List<String>.from(data));
      return right(categories);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      var data = await apiService.get(endPoint: 'products');
      List<Product> products = [];
      for(var product in data['products']){
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

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory({required String category}) async {
   try {
      var data = await apiService.get(endPoint: 'products/category/$category');
      List<Product> products = [];
      for(var product in data['products']){
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
