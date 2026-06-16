import 'package:flutter/material.dart';

class PriceView extends StatelessWidget {
  final double price ;
  const PriceView({super.key , required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
