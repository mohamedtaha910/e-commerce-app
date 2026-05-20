// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitial());
  final FavouriteRepo favouriteRepo;
  List<Product> products = [];

  void loadFavorites() async {
    emit(FavouriteLoading());

    products = await favouriteRepo.fetchAllFavourites();
    emit(FavouriteSuccess(products));
  }

  void addFavourite(Product product) async {
    final exists = products.any((e) => e.id == product.id);

    if (exists) {
      products.removeWhere((e) => e.id == product.id);
    } else {
      products.add(product);
    }

    emit(FavouriteSuccess(List.from(products)));

    await favouriteRepo.addFavourite(product);
  }

  bool isFavourite(int id) {
    return products.any((product) => product.id == id);
  }

  void clearFavourites() {
    favouriteRepo.clearFavourites();
    emit(FavouriteSuccess([]));
  }
}
