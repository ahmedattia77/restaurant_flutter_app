import 'package:flutter/material.dart';

class GoToCheckoutButton extends StatelessWidget {
  final VoidCallback onClick;
  final double totalPrice;
  const GoToCheckoutButton({
    super.key,
    required this.onClick,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Go to Checkout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('\$${totalPrice.toStringAsFixed(2)}'),
          ),
        ],
      ),
      onPressed: () {
        onClick();
      },
    );
  }
}
