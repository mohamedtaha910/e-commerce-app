import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/custom_no_item.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/custom_search_text_feild.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/custom_start_search.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/searched_list_shimmer.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/serched_products_list.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomSearchTextFeild(
                    onChanged: (value) {
                      BlocProvider.of<SearchProductsCubit>(
                        context,
                      ).searchProducts(query: value);
                    },
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 20),
            BlocBuilder<SearchProductsCubit, SearchProductsState>(
              builder: (context, state) {
                if(state is SearchProductsInitial){
                  return CustomStartSearch();
                }
                if (state is SearchProductsFailure) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  );
                }
                if (state is SearchProductsSuccess) {
                  List<Product> products = state.products;
                  if(products.isEmpty){
                    return CustomNoItem();
                  }
                  return SearchedProductsList(products: products);
                }
                return SearchedListShimmer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
