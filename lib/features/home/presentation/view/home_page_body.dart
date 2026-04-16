// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/categories_list.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomAppBar(),
            const SizedBox(height: 36),
            CustomSearchBar(),
            const SizedBox(height: 36),

            const CategoriesList(),
          ],
        ),
      ),
    );
  }
}
