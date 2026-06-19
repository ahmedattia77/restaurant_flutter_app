import 'package:flutter/material.dart';

class FavoritTextView extends StatelessWidget {
  const FavoritTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Favorite',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
