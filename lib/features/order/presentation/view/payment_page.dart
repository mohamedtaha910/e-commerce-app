// import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:flutter/material.dart';

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
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
              title: const Text("Mohamed Taha"),
              subtitle: const Text("Beni Suef, Egypt"),
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total", style: TextStyle(fontSize: 16)),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      _payNow(context);
                    },
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
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

  // 💥 Pay Action
  void _payNow(BuildContext context) {
    // context.read<CartCubit>().checkout(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order placed successfully 🎉")),
    );

    Navigator.pop(context);
  }
}
