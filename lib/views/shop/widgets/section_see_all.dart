

import 'package:flutter/material.dart';

class SectionTextField extends StatelessWidget {
  final String title ;
  const SectionTextField({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title , style: TextStyle(
          fontSize: 22 ,
          fontWeight: FontWeight.w600
        ),) ,
        
        Text('see all' , style: TextStyle(
          fontSize: 16 ,
          fontWeight: FontWeight.w600 ,
          color: Colors.green
        ),) ,

      ],
    );
  }
}