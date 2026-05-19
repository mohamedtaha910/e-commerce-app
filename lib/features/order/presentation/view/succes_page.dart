import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';

class OrderSuccessPage extends StatefulWidget {
  final String orderId;
  final String estimatedDelivery;
  final int itemCount;
  final double totalAmount;

  const OrderSuccessPage({
    super.key,
    required this.orderId,
    required this.estimatedDelivery,
    required this.itemCount,
    required this.totalAmount,
  });

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeSlide;
  late final Animation<double> _checkScale;

  static const _kGreen = Color(0xFF22C55E);
  static const _kGreenLight = Color(0xFFDCFCE7);
  static const _kGray50 = Color(0xFFF9FAFB);
  static const _kGray200 = Color(0xFFE5E7EB);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray600 = Color(0xFF4B5563);
  static const _kGray900 = Color(0xFF111827);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _checkScale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    );
    _fadeSlide = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kGray50,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),

                  // ── Check icon ──────────────────────────────────────────
                  Transform.scale(
                    scale: _checkScale.value,
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: _kGreenLight,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: _kGreen,
                        size: 48,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Title ───────────────────────────────────────────────
                  Opacity(
                    opacity: _fadeSlide.value,
                    child: Transform.translate(
                      offset: Offset(0, 16 * (1 - _fadeSlide.value)),
                      child: Column(
                        children: [
                          const Text(
                            'Order Confirmed!',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: _kGray900,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Thank you! Your order is being processed.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: _kGray400,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ── Order info card ─────────────────────────────────────
                  Opacity(
                    opacity: _fadeSlide.value,
                    child: Transform.translate(
                      offset: Offset(0, 24 * (1 - _fadeSlide.value)),
                      child: _InfoCard(
                        orderId: widget.orderId,
                        itemCount: widget.itemCount,
                        totalAmount: widget.totalAmount,
                        estimatedDelivery: widget.estimatedDelivery,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Steps ───────────────────────────────────────────────
                  Opacity(
                    opacity: _fadeSlide.value,
                    child: Transform.translate(
                      offset: Offset(0, 32 * (1 - _fadeSlide.value)),
                      child: const _StepsCard(),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // ── Buttons ─────────────────────────────────────────────
                  Opacity(
                    opacity: _fadeSlide.value,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _kGray900,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Track Order',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => HomePage()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _kGray600,
                              side: const BorderSide(
                                color: _kGray200,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Continue Shopping',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Info card ──────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final String orderId;
  final int itemCount;
  final double totalAmount;
  final String estimatedDelivery;

  const _InfoCard({
    required this.orderId,
    required this.itemCount,
    required this.totalAmount,
    required this.estimatedDelivery,
  });

  static const _kGreen = Color(0xFF22C55E);
  static const _kGray100 = Color(0xFFF3F4F6);
  static const _kGray200 = Color(0xFFE5E7EB);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _kGray200, width: 1),
      ),
      child: Column(
        children: [
          // Order ID header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: const BoxDecoration(
              color: _kGray100,
              borderRadius: BorderRadius.vertical(top: Radius.circular(17)),
            ),
            child: Row(
              children: [
                const Text(
                  'Order ID',
                  style: TextStyle(
                    fontSize: 12,
                    color: _kGray400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  orderId.length > 20
                      ? orderId.substring(0, 20) + '...'
                      : orderId,
                  style: const TextStyle(
                    fontSize: 12,
                    color: _kGray900,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          _InfoRow(
            label: 'Items ordered',
            value: '$itemCount item${itemCount > 1 ? 's' : ''}',
          ),
          _InfoDivider(),
          _InfoRow(
            label: 'Order total',
            value: '\$${totalAmount.toStringAsFixed(2)}',
            valueColor: _kGray900,
            valueBold: true,
          ),
          _InfoDivider(),
          _InfoRow(label: 'Delivery fee', value: 'Free', valueColor: _kGreen),
          _InfoDivider(),
          _InfoRow(
            label: 'Est. delivery',
            value: estimatedDelivery.substring(0, 10),
            icon: Icons.calendar_today_outlined,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool valueBold;
  final IconData? icon;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valueBold = false,
    this.icon,
  });

  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray700 = Color(0xFF374151);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: _kGray400)),
          const Spacer(),
          if (icon != null) ...[
            Icon(icon, size: 13, color: _kGray400),
            const SizedBox(width: 5),
          ],
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: valueColor ?? _kGray700,
              fontWeight: valueBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF3F4F6),
      indent: 20,
      endIndent: 20,
    );
  }
}

// ── Steps card ─────────────────────────────────────────────────────────────────
class _StepsCard extends StatelessWidget {
  const _StepsCard();

  static const _steps = [
    _StepData('Order placed', 'We received your order', true),
    _StepData('Processing', 'Preparing your items', true),
    _StepData('Shipped', 'On the way to you', false),
    _StepData('Delivered', 'At your door', false),
  ];

  static const _kGray200 = Color(0xFFE5E7EB);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _kGray200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Status',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _kGray900,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            _steps.length,
            (i) => _StepRow(data: _steps[i], isLast: i == _steps.length - 1),
          ),
        ],
      ),
    );
  }
}

class _StepData {
  final String label;
  final String sub;
  final bool done;
  const _StepData(this.label, this.sub, this.done);
}

class _StepRow extends StatelessWidget {
  final _StepData data;
  final bool isLast;

  const _StepRow({required this.data, required this.isLast});

  static const _kGreen = Color(0xFF22C55E);
  static const _kGreenLight = Color(0xFFDCFCE7);
  static const _kGray200 = Color(0xFFE5E7EB);
  static const _kGray400 = Color(0xFF9CA3AF);
  static const _kGray700 = Color(0xFF374151);
  static const _kGray900 = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot + connector line
          SizedBox(
            width: 36,
            child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data.done ? _kGreenLight : _kGray200,
                  ),
                  child: Icon(
                    data.done ? Icons.check_rounded : Icons.circle_outlined,
                    size: 15,
                    color: data.done ? _kGreen : _kGray400,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: data.done
                            ? _kGreen.withOpacity(0.25)
                            : _kGray200,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Labels
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: data.done ? _kGray900 : _kGray400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.sub,
                    style: TextStyle(
                      fontSize: 12,
                      color: data.done ? _kGray700 : _kGray400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
