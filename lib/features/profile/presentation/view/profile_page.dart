// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_page.dart';
import 'package:e_commerce_app/features/favourite/presentation/view/favourite_page.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:e_commerce_app/features/order/presentation/view/orders_page.dart';
import 'package:e_commerce_app/features/profile/presentation/view/change_password_page.dart';
import 'package:e_commerce_app/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:e_commerce_app/features/profile/presentation/view/widgets/profile_row.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 0.4),
              ),
              child: Icon(
                CupertinoIcons.settings_solid,
                color: Colors.black,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ProfileHeader(),
              ),
              Text(
                'Personal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400, width: 0.08),
                ),
                child: Column(
                  children: [
                    ProfileRow(
                      text: 'Orders',
                      textColor: Colors.black87,
                      icon: CupertinoIcons.square_list_fill,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(20),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (c) => OrdersPage()));
                      },
                    ),
                    HorizintalLine(
                      color: Colors.black26,
                      height: 1,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),
                    ProfileRow(
                      text: 'Cart',
                      textColor: Colors.black87,
                      icon: CupertinoIcons.cart_fill,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(20),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (c) => CartPage()));
                      },
                    ),
                    HorizintalLine(
                      color: Colors.black26,
                      height: 1,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),

                    ProfileRow(
                      text: 'Favorites',
                      textColor: Colors.black87,
                      icon: Icons.favorite,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(20),
                      arrowColor: Colors.black54,
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => FavouritePage(isFromProfile: true),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400, width: 0.08),
                ),
                child: Column(
                  children: [
                    ProfileRow(
                      text: 'Settings',
                      textColor: Colors.black87,
                      icon: Icons.settings,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(20),
                      arrowColor: Colors.grey.shade700,
                    ),
                    HorizintalLine(
                      color: Colors.black26,
                      height: 1,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),
                    ProfileRow(
                      text: 'Change Password',
                      textColor: Colors.black87,
                      icon: Icons.lock,
                      iconColor: Colors.blueGrey,
                      circleColor: Colors.black.withAlpha(20),
                      arrowColor: Colors.grey.shade700,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => ChangePasswordPage(),
                          ),
                        );
                      },
                    ),
                    HorizintalLine(
                      color: Colors.black26,
                      height: 1,
                      horizontalMargin: 36,
                      verticalMargin: 16,
                      borderRadius: 12,
                    ),

                    ProfileRow(
                      text: 'Logout',
                      textColor: Colors.redAccent,
                      icon: Icons.logout,
                      iconColor: Colors.redAccent,
                      circleColor: Colors.redAccent.withAlpha(50),
                      arrowColor: Colors.redAccent,
                      onTap: () async {
                        // await FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
