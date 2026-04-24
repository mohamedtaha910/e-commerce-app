import 'package:e_commerce_app/core/models/product_model/product.dart';

abstract class FavouriteRepo {

  bool isFavourite(int id);

  void addFavourite(Product product);

  List<Product> fetchAllFavourites();

}