// import 'package:e_commerce_app/features/order/data/models/order_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class OrderItem extends StatelessWidget {
//   const OrderItem({super.key, required this.order});
//   final Order order;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       margin: EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.black12, width: 0.4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 4,
//             offset: (Offset(0, 2)),
//             spreadRadius: 0.6,
//             // blurStyle: BlurStyle.outer,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             // width: 60,
//             // height: 60,
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.blue.withAlpha(38),
//               // borderRadius: BorderRadius.circular(12),
//               shape: BoxShape.circle,

//               // border: Border.all(color: Colors.green.shade700, width: 0.8),
//             ),
//             // child: Icon(CupertinoIcons.square_list_fill, color: Colors.blue),
//             child: SvgPicture.asset(
//               'assets/icons/order.svg',
//               color: Colors.blue.shade500,
//               width: 24,
//               height: 28,
//             ),
//           ),
//           SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Order #${order.id.length < 12 ? order.id : '${order.id.substring(0, 12)}...'}',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Total: \$${order.total.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey.shade600,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 '${order.items.length} items',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey.shade600,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: 4),
//             ],
//           ),
//           Spacer(),
//           Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade600),
//         ],
//       ),
//     );
//   }
// }

// ---------------------------------------------
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/presentation/view/order_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final Order order;

  static const _kWhite = Colors.white;
  static const _kBorder = Color(0xFFE9E9E7);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray900 = Color(0xFF111827);
  static const _kBlueBg = Color(0xFFEFF6FF);
  static const _kBlue = Color(0xFF3B82F6);

  // ── status config ──────────────────────────────────────────────────────────
  static _StatusStyle _statusStyle(String? status) {
    switch ((status ?? '').toLowerCase()) {
      case 'delivered':
        return _StatusStyle(
          bg: const Color(0xFFECFDF5),
          text: const Color(0xFF15803D),
          dot: const Color(0xFF22C55E),
          label: 'Delivered',
        );
      case 'shipped':
        return _StatusStyle(
          bg: const Color(0xFFFEF9C3),
          text: const Color(0xFFA16207),
          dot: const Color(0xFFEAB308),
          label: 'Shipped',
        );
      case 'cancelled':
        return _StatusStyle(
          bg: const Color(0xFFFEF2F2),
          text: const Color(0xFFB91C1C),
          dot: const Color(0xFFEF4444),
          label: 'Cancelled',
        );
      default: // processing
        return _StatusStyle(
          bg: _kBlueBg,
          text: const Color.fromARGB(255, 72, 116, 212),
          dot: _kBlue,
          label: 'Processing',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = _statusStyle('Processing');
    final shortId = order.id.length > 14
        ? '#${order.id.substring(0, 14)}…'
        : '#${order.id}';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsPage(order: order),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: _kWhite,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _kBorder, width: 1),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // ── Icon ────────────────────────────────────────────────────
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _kBlueBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/order.svg',
                      colorFilter: const ColorFilter.mode(
                        _kBlue,
                        BlendMode.srcIn,
                      ),
                      width: 22,
                      height: 28,
                    ),
                    // child: Icon(
                    //   CupertinoIcons.cart_fill,
                    //   color: _kBlue,
                    //   size: 22,
                    // ),
                  ),
                ),

                const SizedBox(width: 14),

                // ── Info ─────────────────────────────────────────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shortId,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _kGray900,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '${order.items.length} ${order.items.length > 1 ? 'items' : 'item'}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: _kGray400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const _Dot(),
                          const SizedBox(width: 6),

                          // Replace order.date with your actual date field if available
                          Text(
                            order.date.toString().substring(0, 10),
                            style: const TextStyle(
                              fontSize: 12,
                              color: _kGray400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // ── Right: price + status ────────────────────────────────────
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${order.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _kGray900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _StatusBadge(style: style),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Status badge ───────────────────────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  final _StatusStyle style;
  const _StatusBadge({required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: style.bg,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(shape: BoxShape.circle, color: style.dot),
          ),
          const SizedBox(width: 5),
          Text(
            style.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: style.text,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusStyle {
  final Color bg;
  final Color text;
  final Color dot;
  final String label;
  const _StatusStyle({
    required this.bg,
    required this.text,
    required this.dot,
    required this.label,
  });
}

// ── Small dot separator ────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  const _Dot();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFD1D5DB),
      ),
    );
  }
}
