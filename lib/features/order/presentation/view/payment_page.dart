// import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class PaymentPage extends StatelessWidget {
//   const PaymentPage({super.key, required this.country, required this.city, required this.address, required this.totalPrice, required this.checkoutProducts});
//   final String country;
//   final String city;
//   final String address;
//   final double totalPrice ;
//   final List <CartProduct> checkoutProducts;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Payment')),
//       body: Center(child: Text('Payment Page')),
//     );
//   }
// }
// ===================================================
class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.country,
    required this.city,
    required this.address,
    required this.totalPrice,
    required this.checkoutProducts,
    required this.fullName,
  });
  final String fullName;
  final String country;
  final String city;
  final String address;
  final double totalPrice;
  final List<CartProduct> checkoutProducts;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    final total = 1919.99;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
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
                  border: Border.all(color: Colors.black12, width: 0.4),
                ),
                child: Icon(Icons.arrow_back_ios, size: 18),
              ),
            ),
            SizedBox(width: 16),
            Text(
              'Payment Method',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // 🏠 Address Section
          _sectionTitle("Shipping Address"),
          _card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(widget.fullName),
              subtitle: Text('${widget.city}, ${widget.country}'),
              trailing: const Icon(Icons.edit),
            ),
          ),

          // 💳 Payment Methods
          _sectionTitle("Payment Method"),

          _paymentTile(0, Icons.credit_card, "Credit Card"),
          _paymentTile(1, Icons.account_balance_wallet, "Cash on Delivery"),
          _paymentTile(2, Icons.paypal, "PayPal"),

          const Spacer(),

          // 💰 Total + Pay Button
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,

        children: [
          Container(
            height: 125,
            padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
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
                      '${widget.totalPrice.toStringAsFixed(2)} \$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => _payNow(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Confirm Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -16,
            right: 0,
            child: Container(
              // height: 40,
              // width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12, width: 0.8),
              ),
              child: Center(
                child: Text(
                  '${widget.checkoutProducts.length}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          ...List.generate(
            widget.checkoutProducts.length,
            (index) => Positioned(
              top: -16,
              left: index * 28.0,
              child: Container(
                // height: 40,
                // width: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 0.8),
                ),
                child: Image.network(
                  widget.checkoutProducts[index].product.images![0],
                  height: 30,
                  width: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Payment Tile
  Widget _paymentTile(int index, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: _card(
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            Radio(
              value: index,
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Title
  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  // 🔹 Card Wrapper
  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  //  Pay Action
  void _payNow(BuildContext context) {
    final order = Order(
      id: DateTime.now().toString(),
      items: widget.checkoutProducts,
      total: widget.totalPrice,
      date: DateTime.now(),
      city: widget.city,
      country: widget.country,
      address: widget.address,
    );
    BlocProvider.of<OrderCubit>(context).addOrder(order);
    BlocProvider.of<CartCubit>(context).clearCart();

    successMessage(context);
  }

  void successMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.green, size: 32),
            ),
            SizedBox(height: 16),
            Text(
              'Order placed successfully!',
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
                // CustomButton(
                //   title: 'Cancel',
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   verticalPadding: 4,
                //   color: AppColors.primaryColor.withAlpha(50),
                //   textColor: AppColors.primaryColor,
                //   horizontalMargin: 8,
                //   titleSize: 14,
                // ),
                CustomButton(
                  title: 'Go to Home',
                  titleSize: 14,
                  onTap: () {
                    BlocProvider.of<CartCubit>(context).clearCart();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  verticalPadding: 4,
                  color: Colors.green.withAlpha(50),
                  textColor: Colors.green,
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
