import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/order/presentation/view/payment_page.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/adress_text_feild.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.totalPrice,
    required this.checkoutProducts,
    required this.isFromCart,
  });
  final double totalPrice;
  final List<CartProduct> checkoutProducts;
  final bool isFromCart;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String fullName = '';
  String country = '';
  String city = '';
  String address = '';
  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12, width: 0.4),
                  ),
                  child: Icon(Icons.chevron_left_rounded, size: 28),
                ),
              ),
              SizedBox(width: 16),
              Text(
                'Shipping Address',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 16),
                  Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AdressTextFeild(
                    label: 'Full Name',
                    maxLines: 1,
                    borderRadius: 35,
                    onChanged: (value) {
                      fullName = value;
                    },
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AdressTextFeild(
                    label: 'Country',
                    maxLines: 1,
                    borderRadius: 35,
                    onChanged: (value) {
                      country = value;
                    },
                  ),
                  SizedBox(height: 24),
                  Text(
                    'City',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AdressTextFeild(
                    label: 'City',
                    maxLines: 1,
                    borderRadius: 35,
                    onChanged: (value) {
                      city = value;
                    },
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AdressTextFeild(
                    label: 'Address Details',
                    maxLines: 4,
                    borderRadius: 20,
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,

          children: [
            Container(
              height: 125,
              padding: const EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
                bottom: 8,
              ),
              margin: EdgeInsets.only(bottom: 18, right: 10, left: 10),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${widget.totalPrice.toStringAsFixed(2)} \$',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  GestureDetector(
                    onTap: () {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              country: country,
                              city: city,
                              address: address,
                              totalPrice: widget.totalPrice,
                              checkoutProducts: widget.checkoutProducts,
                              fullName: fullName,
                              isFromCart: widget.isFromCart,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      width: double.infinity,
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              'Continue',
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
                              size: 16,
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
              top: -17,
              right: 3,
              child: Container(
                // height: 40,
                // width: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
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
      ),
    );
  }
}
