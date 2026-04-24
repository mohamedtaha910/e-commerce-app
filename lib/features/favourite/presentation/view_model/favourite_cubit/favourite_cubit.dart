// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitial());
  final FavouriteRepo favouriteRepo;

  void loadFavorites() {
    emit(FavouriteLoading());

    List<Product> products = favouriteRepo.fetchAllFavourites();
    emit(FavouriteSuccess(products));
  }

  void addFavourite(Product product) {
    favouriteRepo.addFavourite(product);
    loadFavorites();
  }

  bool isFavourite(int id) => favouriteRepo.isFavourite(id);
}
