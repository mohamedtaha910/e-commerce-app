// import 'package:e_commerce_app/core/models/product_model/product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_product_list.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/custom_cart_empty.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
// import 'package:e_commerce_app/features/search/presentation/view/widgets/serched_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).loadCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        List<CartProduct> cartProducts = [];
        // List<Product> products = [];
        double totalPrice = 0;
        if (state is CartSuccess) {
          cartProducts = state.cartProducts;

          // for (var item in cartProducts) {
          //   products.add(item.product);
          // }

          for (var item in cartProducts) {
            totalPrice += item.product.price! * item.quantity;
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 6,
                        top: 8,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black12, width: 0.4),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Cart ',
                    style: TextStyle(
                      // fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      deleteAllCartMessage(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black12, width: 0.4),
                      ),
                      child: Icon(
                        Icons.delete_sweep_rounded,
                        size: 24,
                        // color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: cartProducts.isEmpty
                ? CustomCartEmpty()
                : Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      left: 16,
                      top: 16,
                    ),
                    child: CartProductList(cartProducts: cartProducts),
                  ),

            bottomNavigationBar: Container(
              height: 125,
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withAlpha(30),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12, width: 0.8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Est. Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${totalPrice.toStringAsFixed(2)} \$',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  void deleteAllCartMessage(BuildContext context) {
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
              'Are you sure you want to clear your cart?',
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
                  color: AppColors.primaryColor.withAlpha(50),
                  textColor: AppColors.primaryColor,
                  horizontalMargin: 8,
                  titleSize: 14,
                ),
                CustomButton(
                  title: 'Ok',
                  titleSize: 14,
                  onTap: () {
                    BlocProvider.of<CartCubit>(context).clearCart();
                    Navigator.pop(context);
                  },
                  verticalPadding: 4,
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
