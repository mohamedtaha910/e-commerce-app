import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utils/api_services.dart';
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
}
