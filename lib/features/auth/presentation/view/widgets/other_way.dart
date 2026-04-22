import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherWay extends StatelessWidget {
  const OtherWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
      
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
              Text(
                '  Or continue with  ',
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
      
            children: [
              SvgPicture.asset('assets/auth_images/facebook.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('assets/auth_images/google.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('assets/auth_images/apple.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
