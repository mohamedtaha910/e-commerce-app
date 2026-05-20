import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/favourite/data/repos/favourite_repo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';

class FavouriteRepoImplementation implements FavouriteRepo {
  // final FirebaseAuth auth;

  //  FavouriteRepoImplementation({required this.auth});


  final Box<Product> box = Hive.box<Product>('favProducts');

 

  @override
  void addFavourite(Product product) {
    if (isFavourite(product.id!)) {
      box.delete(product.id);
    } else {
      box.put(product.id, product);
    }
  }

  @override
  List<Product> fetchAllFavourites() {
    List<Product> favourites = [];
    for (var item in box.values) {
      favourites.add(item);
    }
    return favourites;
  }

  @override
  bool isFavourite(int id) => box.containsKey(id);
  
  @override
  void clearFavourites() {
    box.clear();
  }
}
