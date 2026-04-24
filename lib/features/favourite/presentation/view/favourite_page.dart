import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/widgets/custom_no_favourite.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/serched_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context).loadFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'My Favourite',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          
          if (state is FavouriteSuccess) {
            List<Product> products = state.favourites;

            return products.isNotEmpty
                ? SearchedProductsList(products: products)
                : CustomNoFavourite();
          } else {
            return const Center(child: Text('No Favourite222'));
          }
        },
      ),
    );
  }
}
