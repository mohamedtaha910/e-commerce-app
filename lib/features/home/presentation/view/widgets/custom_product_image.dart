import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductImage extends StatefulWidget {
  const CustomProductImage({super.key, required this.product});
  final Product product;

  @override
  State<CustomProductImage> createState() => _CustomProductImageState();
}

class _CustomProductImageState extends State<CustomProductImage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 240,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  items: widget.product.images!.map((imageUrl) {
                    return Builder(
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.network(imageUrl, fit: BoxFit.contain),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.product.images!.length == 1
                      ? []
                      : List.generate(
                          widget.product.images!.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: currentIndex == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                ),
              ],
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
                      onTap: () => BlocProvider.of<FavouriteCubit>(
                        context,
                      ).addFavourite(widget.product),
                      child:
                          BlocProvider.of<FavouriteCubit>(
                            context,
                          ).isFavourite(widget.product.id!)
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
    );
  }
}
