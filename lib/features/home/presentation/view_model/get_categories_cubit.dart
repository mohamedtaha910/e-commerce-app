// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this.homeRepo) : super(GetCategoriesInitial());
  final HomeRepo homeRepo ;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    var result = await homeRepo.getCategories();
    result.fold((failure) {
      emit(GetCategoriesFailure(failure.errorMessage));
    }, (categories) {
      emit(GetCategoriesSuccess(categories));
    });
  }
}
