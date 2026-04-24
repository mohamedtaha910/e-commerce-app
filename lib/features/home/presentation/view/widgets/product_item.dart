import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: 160,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    // color: AppColors.itemColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: product.images?[0] == null
                      ? Image.asset('assets/images/test1.png')
                      : Image.network(
                          product.images?[0] ?? '',
                          fit: BoxFit.contain,
                        ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<FavouriteCubit>(
                              context,
                            ).addFavourite(product);
                          },
                          child:
                              BlocProvider.of<FavouriteCubit>(
                                context,
                              ).isFavourite(product.id!)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 22,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/heart.svg',
                                  height: 22,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ' \$ ${product.price ?? ''}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
