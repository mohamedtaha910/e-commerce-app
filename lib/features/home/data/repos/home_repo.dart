import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

abstract class HomeRepo {

  Future<Either<Failure, List<String>>> getCategories();
}