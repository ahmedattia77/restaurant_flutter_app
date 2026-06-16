

import 'package:flutter/material.dart';

class ReviewItemView extends StatelessWidget {
  final double rating ;
  const ReviewItemView({super.key ,required this.rating });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final contianerbackground = isDarkMode ? Colors.white10 : Colors.black12;

    const int ratingLevel = 5 ;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Review',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(ratingLevel, (index) {

              return Icon(Icons.star , color :
              index <= rating-1 ? Colors.amber : contianerbackground);
            },),
            const SizedBox(width: 20),
            Icon(Icons.arrow_forward_ios_outlined ,size: 20,),
          ],
        ),
      ],
    );

  }
}