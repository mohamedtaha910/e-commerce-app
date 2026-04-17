import 'package:e_commerce_app/features/home/presentation/view/widgets/product_item.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_products/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsFailure) {
          return Text(
            state.errorMessage,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          );
        }
        if (state is GetProductsSuccess) {
          List products = state.products;

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 0.4, // 1.8
              childAspectRatio: 0.7, // 1.8
              crossAxisSpacing: 10, // x axis spacing
              mainAxisSpacing: 10, // y axis spacing
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: products[index],
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
