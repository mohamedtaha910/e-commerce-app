
part of 'get_categories_cubit.dart';


abstract class GetCategoriesState {
  
}

class GetCategoriesInitial extends GetCategoriesState {}
class GetCategoriesSuccess extends GetCategoriesState {
  final List<String> categories;
  GetCategoriesSuccess(this.categories);
}
class GetCategoriesFailure extends GetCategoriesState {
  final String errorMessage;
  GetCategoriesFailure(this.errorMessage);
}
class GetCategoriesLoading extends GetCategoriesState {}


