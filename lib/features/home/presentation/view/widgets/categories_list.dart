import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<String> categories = [
    'All',
    'Hoodies',
    'T-Shirts',
    'Pants',
    'Shoes',
    'Accessories',
    'Jackets',
    'Sweaters',
    'Dresses',
    'Skirts',
  ];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/Categories.svg'),
       
        const SizedBox(height: 16),
      //  category list
        SizedBox(
          height: 33,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                },
                child: Container(
                  // width: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: selectedCategory == categories[index]
                        ? AppColors.primaryColor
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 12,
                        // color: AppColors.text2Color,
                        color: selectedCategory == categories[index]
                            ? Colors.white
                            : Colors.black38,
                        fontWeight: selectedCategory == categories[index]
                            ? FontWeight.w700
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 24),

        // product grid
        ProductGrid(),
      ],
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
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
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
