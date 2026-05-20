import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';

class FavouriteRepoImplementation implements FavouriteRepo {
  final FirebaseAuth auth;

  FavouriteRepoImplementation({required this.auth});

  Future<Box<Product>> _openBox() async {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }
    final uid = user.uid;

    return await Hive.openBox<Product>('favorites_$uid');
  }

  @override
  Future<void> addFavourite(Product product) async {
    final box = await _openBox();
    if (await isFavourite(product.id!)) {
      box.delete(product.id);
    } else {
      box.put(product.id, product);
    }
  }

  @override
  Future<List<Product>> fetchAllFavourites() async {
    final box = await _openBox();

    return box.values.toList();
  }

  @override
  Future<void> clearFavourites() async {
    final box = await _openBox();
    box.clear();
  }

  @override
  Future<bool> isFavourite(int id) async {
    final box = await _openBox();
    return box.containsKey(id);
  }
}
