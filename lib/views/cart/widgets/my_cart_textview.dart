

import 'package:flutter/material.dart';

class MyCardTextView extends StatelessWidget {
  const MyCardTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
            child: Text(
              'My Card',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
  }
}