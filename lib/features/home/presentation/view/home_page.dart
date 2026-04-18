import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_page.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/favourite_page.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page_body.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_page.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/search_products_cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePageBody(),
    BlocProvider(
      create: (context) =>
          SearchProductsCubit(getIt.get<SearchRepoImplementation>()),
      child: SearchPage(),
    ),
    FavouritePage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          pages[currentIndex],

          Positioned(
            // top: 100,
            bottom: 0,
            left: 0,
            right: 0,
            height: 30,
            // height: 55,
            // height: 63,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white38,

                    // Colors.transparent
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            // height: 100,
            //  bottom: 0,  // => emulator
            bottom: 16, // => windows
            left: 6,
            right: 6,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),

                  child: NavigationBar(
                    labelPadding: const EdgeInsets.all(0),
                    // height: 63, // emulator
                    height: 56, // => windows
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    animationDuration: Duration(milliseconds: 400),
                    indicatorColor: AppColors.primaryColor.withAlpha(50),
                    // backgroundColor: Colors.white,
                    // backgroundColor: const Color.fromARGB(255, 231, 229, 229),
                    backgroundColor: Colors.grey[300],
                    onDestinationSelected: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    selectedIndex: currentIndex,
                    destinations: [
                      NavigationDestination(
                        // icon: Icon(Icons.home_outlined , ),
                        icon: SvgPicture.asset(
                          'assets/icons/Home.svg',
                          colorFilter: ColorFilter.mode(
                            Colors.black54,
                            BlendMode.srcIn,
                          ),
                        ),
                        selectedIcon: SvgPicture.asset(
                          'assets/icons/home_selected.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          colorFilter: ColorFilter.mode(
                            Colors.black54,
                            BlendMode.srcIn,
                          ),
                        ),
                        selectedIcon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Search',
                      ),
                      NavigationDestination(
                        icon: SvgPicture.asset(
                          'assets/icons/heart.svg',
                          height: 24,
                        ),
                        selectedIcon: Icon(
                          Icons.favorite,
                          color: AppColors.primaryColor,
                        ),
                        label: 'Favourites',
                      ),
                      NavigationDestination(
                        icon: SvgPicture.asset(
                          'assets/icons/Profile.svg',
                          colorFilter: ColorFilter.mode(
                            Colors.black54,
                            BlendMode.srcIn,
                          ),
                        ),
                        selectedIcon: SvgPicture.asset(
                          'assets/icons/Profile_selected.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
