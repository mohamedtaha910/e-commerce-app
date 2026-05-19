import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/widgets/custom_no_favourite.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/serched_products_list.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key, required this.isFromProfile});
  final bool isFromProfile;

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
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            widget.isFromProfile == true
                ? GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 6,
                        top: 6,
                        bottom: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 0.4),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            widget.isFromProfile == true ? Spacer() : SizedBox.shrink(),

            // const SizedBox(width: 8),
            // Spacer(),
            Text(
              'My Favourite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                deleteAllFavouriteMessage(context);
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Icon(Icons.delete_sweep, color: Colors.red, size: 24),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteSuccess) {
            List<Product> products = state.favourites;

            return Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16, top: 8),
              child: products.isNotEmpty
                  ? SearchedProductsList(products: products)
                  : CustomNoFavourite(),
            );
          } else {
            return const Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }

  void deleteAllFavouriteMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.delete, color: Colors.red, size: 32),
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to clear your favourite?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  verticalPadding: 4,
                  color: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  horizontalMargin: 8,
                  titleSize: 14,
                  isBorder: true,
                ),
                CustomButton(
                  title: 'Ok',
                  titleSize: 14,
                  onTap: () {
                    BlocProvider.of<FavouriteCubit>(context).clearFavourites();
                    Navigator.pop(context);
                  },
                  verticalPadding: 4,
                  // color: AppColors.primaryColor,
                  color: Colors.red.withAlpha(50),
                  textColor: Colors.red,
                  horizontalMargin: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
