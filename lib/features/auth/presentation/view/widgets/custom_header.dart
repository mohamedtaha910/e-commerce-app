// import 'package:e_commerce_app/core/utils/colors.dart';
// import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomHeader extends StatelessWidget {
//   const CustomHeader({super.key, required this.image, required this.text});
//   final String image;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.47,
//           width: MediaQuery.of(context).size.width,
//           child: ShaderMask(
//             blendMode: BlendMode
//                 .srcIn, // Ensures the gradient only fills the SVG shape
//             shaderCallback: (Rect bounds) {
//               return LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   AppColors.primaryColor.withAlpha(150),
//                   Colors.purple.withAlpha(150),
//                 ],
//               ).createShader(bounds);
//             },
//             child: SvgPicture.asset(
//               'assets/auth_images/header1.svg',
//               // color: const Color.fromARGB(255, 198, 172, 151),
//               // color: AppColors.secondaryColor.withAlpha(120),
//               // color: AppColors.primaryColor.withAlpha(230),
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 25,
//           left: 85,
//           right: 85,
//           child: SvgPicture.asset(
//             image,
//             fit: BoxFit.fill,
//             height: MediaQuery.of(context).size.height * 0.28,
//             // width: 130,
//           ),
//         ),
//         Positioned(
//           top: 20,
//           left: 12,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: const EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 // color: Colors.black38,
//                 color: Colors.grey.shade100,
//                 // color: AppColors.primaryColor.withAlpha(200),
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.black26, width: 0.4),
//               ),
//               child: Icon(
//                 Icons.chevron_left_rounded,
//                 color: Colors.black54,
//                 size: 28,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 45,
//           left: 16,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SvgPicture.asset(text, width: 130),
//               SizedBox(height: 8),
//               CustomLine(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// ===================================================================
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.showBack = true,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool showBack;

  // static const _kPurple = Color.fromARGB(255, 237, 134, 71);
  static const _kPurple = AppColors.primaryColor;
  static const _kPurpleL = Color.fromARGB(255, 253, 174, 119);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_kPurple, _kPurpleL, _kPurple],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Stack(
        children: [
          // ── Decorative circles ───────────────────────────────────────────
          Positioned(
            top: -60,
            right: -50,
            child: _Circle(color: Colors.white, size: 220, opacity: 0.12),
          ),
          Positioned(
            top: 140,
            left: -30,
            child: _Circle(color: Colors.white, size: 140, opacity: 0.3),
          ),
          Positioned(
            bottom: -50,
            right: -30,
            child: _Circle(color: Colors.black, size: 140, opacity: 0.2),
          ),

          // ── Radial highlight ─────────────────────────────────────────────
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
                gradient: RadialGradient(
                  center: const Alignment(0.6, -0.6),
                  radius: 0.8,
                  colors: [Colors.white.withOpacity(0.12), Colors.transparent],
                ),
              ),
            ),
          ),

          // ── Back button ──────────────────────────────────────────────────
          if (showBack)
            Positioned(
              top: 16,
              left: 16,
              child: SafeArea(
                bottom: false,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 0.8,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          // ── Centre icon ──────────────────────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 140,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 1.5,
                  ),
                ),
                child: Icon(icon, color: Colors.white, size: 70),
              ),
            ),
          ),

          // ── Title + subtitle ─────────────────────────────────────────────
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.vertical(
          //         bottom: Radius.circular(32),
          //       ),
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [Colors.transparent, Colors.black.withOpacity(0.18)],
          //       ),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           title,
          //           style: const TextStyle(
          //             fontSize: 26,
          //             fontWeight: FontWeight.w700,
          //             color: Colors.white,
          //             letterSpacing: -0.5,
          //             height: 1.1,
          //           ),
          //         ),
          //         const SizedBox(height: 4),
          //         Text(
          //           subtitle,
          //           style: TextStyle(
          //             fontSize: 13,
          //             color: Colors.white.withOpacity(0.65),
          //             fontWeight: FontWeight.w400,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final double opacity;
  final Color color;
  const _Circle({
    required this.size,
    required this.opacity,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(opacity), width: 1),
      ),
    );
  }
}
