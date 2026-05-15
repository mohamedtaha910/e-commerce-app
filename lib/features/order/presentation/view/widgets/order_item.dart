import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: (Offset(0, 2)),
            spreadRadius: 0.6,
            // blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            // width: 60,
            // height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(38),
              // borderRadius: BorderRadius.circular(12),
              shape: BoxShape.circle,

              // border: Border.all(color: Colors.green.shade700, width: 0.8),
            ),
            // child: Icon(CupertinoIcons.square_list_fill, color: Colors.blue),
            child: SvgPicture.asset(
              'assets/icons/order.svg',
              color: Colors.blue.shade500,
              width: 24,
              height: 28,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #${order.id.length < 12 ? order.id : '${order.id.substring(0, 12)}...'}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Total: \$${order.total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${order.items.length} items',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}
