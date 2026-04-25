import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNoFavourite extends StatelessWidget {
  const CustomNoFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Spacer(),
        Image.asset('assets/icons/favourite_.jpg' , height: 200,),
        // SvgPicture.asset('assets/icons/empty_wish_list.svg' , height: 300,),
        const SizedBox(height: 18),
        Center(
          child: Text(
            'No Favourites Products Yet !',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // const Spacer(),
      ],
    );
  }
}