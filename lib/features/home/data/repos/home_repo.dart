import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<String>>> getCategories();

  Future<Either<Failure, List<Product>>> getProductsByCategory({required String category});

  Future<Either<Failure, List<Product>>> getAllProducts();
}
