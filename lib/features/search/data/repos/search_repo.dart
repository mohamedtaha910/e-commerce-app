import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Product>>> searchedProductsList({required String query});
}