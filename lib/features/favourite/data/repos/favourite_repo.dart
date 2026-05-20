import 'package:e_commerce_app/core/models/product_model/product.dart';

abstract class FavouriteRepo {
  Future<bool> isFavourite(int id);

  Future<void> addFavourite(Product product);

  Future<List<Product>> fetchAllFavourites();

  Future<void> clearFavourites();
}
