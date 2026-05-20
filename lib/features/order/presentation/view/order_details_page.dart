// import 'package:e_commerce_app/features/order/data/models/order_model.dart';
// import 'package:e_commerce_app/features/order/presentation/view/widgets/adress_info.dart';
// import 'package:e_commerce_app/features/order/presentation/view/widgets/id_info.dart';
// import 'package:e_commerce_app/features/order/presentation/view/widgets/order_products_list.dart';
// import 'package:e_commerce_app/features/order/presentation/view/widgets/total_price_info.dart';
// import 'package:flutter/material.dart';

// class OrderDetailsPage extends StatelessWidget {
//   const OrderDetailsPage({super.key, required this.order});
//   final Order order;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 padding: const EdgeInsets.only(
//                   left: 14,
//                   right: 6,
//                   top: 8,
//                   bottom: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade100,
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.black12, width: 0.4),
//                 ),
//                 child: Icon(Icons.arrow_back_ios, size: 18),
//               ),
//             ),
//             // SizedBox(width: 16),
//             Spacer(),
//             Text(
//               'Order Details',
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             Spacer(),
//             SizedBox(width: 24),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 16),
//               Text(
//                 'Order ID',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               // IdInfo(id: order.id),
//               IdInfo(id: order.id),
//               SizedBox(height: 24),
//               Text(
//                 'Total Price',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               TotalPriceInfo(total: order.total),
//               SizedBox(height: 24),
//               Text(
//                 'Shipping Address ',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               AdressInfo(
//                 address: order.address,
//                 city: order.city,
//                 country: order.country,
//               ),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Text(
//                     'Items',
//                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     '${order.items.length} ${order.items.length > 1 ? 'Products' : 'Product'}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               OrderProductsList(cartProducts: order.items),
//               SizedBox(height: 36),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ------------------
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view/widgets/order_products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  // ── palette ────────────────────────────────────────────────────────────────
  static const _kBg = Color(0xFFF7F7F5);
  static const _kWhite = Colors.white;
  static const _kBorder = Color(0xFFE9E9E7);
  static const _kGray50 = Color(0xFFF3F4F6);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray600 = Color(0xFF6B7280);
  static const _kGray900 = Color(0xFF111827);
  static const _kGreen = Color(0xFF22C55E);
  static const _kGreenBg = Color(0xFFECFDF5);
  static const _kGreenBdr = Color(0xFFA7F3D0);
  static const _kGreenTxt = Color(0xFF15803D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status chip
            Center(child: _StatusChip(status: 'Processing')),
            const SizedBox(height: 20),

            // Order info card (ID + Total + Address)
            _InfoCard(order: order),
            const SizedBox(height: 20),

            // Items header
            _SectionHeader(count: order.items.length),
            const SizedBox(height: 12),

            // Products list (your existing widget, unchanged)
            OrderProductsList(cartProducts: order.items),
            const SizedBox(height: 20),

            // Total footer
            _TotalFooter(total: order.total),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _kWhite,
      surfaceTintColor: _kWhite,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: _kGray50),
      ),
      title: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: _kGray50,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12, width: 0.4),
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                size: 28,
                color: Colors.black54,
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Order Details',
            style: TextStyle(
              color: _kGray900,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 36), // balance
        ],
      ),
    );
  }
}

// ── Status chip ────────────────────────────────────────────────────────────────
class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  static const _kGreen = Color(0xFF22C55E);
  static const _kGreenBg = Color(0xFFECFDF5);
  static const _kGreenBdr = Color(0xFFA7F3D0);
  static const _kGreenTxt = Color(0xFF15803D);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _kGreenBg,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _kGreenBdr, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: _kGreen,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            status,
            style: const TextStyle(
              color: _kGreenTxt,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info card ──────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final Order order;
  const _InfoCard({required this.order});

  static const _kWhite = Colors.white;
  static const _kBorder = Color(0xFFE9E9E7);
  static const _kGray50 = Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _kWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _kBorder, width: 1),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.confirmation_number_rounded,
            iconSize: 22,
            label: 'Order ID',
            child: _CopyableId(id: order.id),
          ),
          _RowDivider(),
          _InfoRow(
            icon: CupertinoIcons.creditcard_fill,
            iconSize: 22,
            label: 'Order Total',
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const TextSpan(
                    text: '  ·  Free delivery',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _RowDivider(),
          _InfoRow(
            icon: CupertinoIcons.location_circle_fill,
            iconSize: 26,
            label: 'Shipping Address',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.address,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${order.city} · ${order.country}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget child;
  final double iconSize;

  _InfoRow({
    required this.icon,
    required this.label,
    required this.child,
    required this.iconSize,
  });

  Color backColor = Colors.blue.withAlpha(30);
  Color iconColor = Colors.blueAccent.withAlpha(220);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon bubble
          Container(
            width: 38,
            height: 39,
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: iconSize, color: iconColor),
          ),
          const SizedBox(width: 14),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 5),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RowDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF3F4F6),
      indent: 24,
      endIndent: 24,
    );
  }
}

// Copyable order ID with tap-to-copy
class _CopyableId extends StatefulWidget {
  final String id;
  const _CopyableId({required this.id});

  @override
  State<_CopyableId> createState() => _CopyableIdState();
}

class _CopyableIdState extends State<_CopyableId> {
  bool _copied = false;

  void _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.id));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  static const _kGray50 = Color(0xFFF3F4F6);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copy,
      child: Row(
        children: [
          Text(
            widget.id,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _kGray900,
              letterSpacing: 0.3,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(width: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _copied
                ? const Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: Color(0xFF22C55E),
                  )
                : Icon(Icons.copy_rounded, size: 14, color: _kGray400),
          ),
        ],
      ),
    );
  }
}

// ── Section header ─────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final int count;
  const _SectionHeader({required this.count});

  static const _kGray50 = Color(0xFFF3F4F6);
  static const _kGray600 = Color(0xFF6B7280);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Items',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: _kGray900,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: _kGray50,
            borderRadius: BorderRadius.circular(99),
            // border: Border.all(color: Colors.black12, width: 0.2),
          ),
          child: Text(
            '$count ${count > 1 ? 'Products' : 'Product'}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _kGray600,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Total footer ───────────────────────────────────────────────────────────────
class _TotalFooter extends StatelessWidget {
  final double total;
  const _TotalFooter({required this.total});

  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: _kGray900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text(
            'Order Total',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '\$${total.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
