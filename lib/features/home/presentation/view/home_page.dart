import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/favourite_page.dart';
import 'package:e_commerce_app/features/favourite/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page_body.dart';
import 'package:e_commerce_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:e_commerce_app/features/profile/presentation/view/profile_page.dart';
import 'package:e_commerce_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_page.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/search_products_cubit/search_products_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      child: SearchPage(isInHome: false),
    ),
    FavouritePage(isFromProfile: false),
    // CartPage(),
    BlocProvider(
      create: (context) =>
          ProfileCubit(ProfileRepoImplementation(auth: FirebaseAuth.instance)),
      child: ProfilePage(),
    ),
  ];
  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context).loadFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          pages[currentIndex],

          //  shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(30),
                    // Colors.white.withAlpha(10),

                    // Colors.transparent
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),

                  child: NavigationBar(
                    labelPadding: const EdgeInsets.all(0),
                    height: 56,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    animationDuration: Duration(milliseconds: 200),
                    indicatorColor: AppColors.primaryColor.withAlpha(60),
                    backgroundColor: const Color.fromARGB(255, 237, 234, 233),
                    // backgroundColor: const Color.fromARGB(255, 231, 229, 229),
                    onDestinationSelected: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    selectedIndex: currentIndex,
                    destinations: [
                      NavigationDestination(
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

                      // NavigationDestination(
                      //   icon: SvgPicture.asset(
                      //     'assets/icons/bag.svg',
                      //     height: 24,
                      //     colorFilter: ColorFilter.mode(
                      //       Colors.black54,
                      //       BlendMode.srcIn,
                      //     ),
                      //   ),
                      //   selectedIcon: SvgPicture.asset(
                      //     'assets/icons/bag.svg',
                      //     height: 24,
                      //     colorFilter: ColorFilter.mode(
                      //       AppColors.primaryColor,
                      //       BlendMode.srcIn,
                      //     ),
                      //   ),
                      //   label: 'Cart',
                      // ),
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
