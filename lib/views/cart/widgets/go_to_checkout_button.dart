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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Row(
        children: [
          // SizedBox(width: 50),
                    const Expanded(child: SizedBox.shrink()),

          const Text(
            textAlign: TextAlign.center,
            'Go to Checkout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      textAlign: TextAlign.center,
                      '\$${totalPrice.toStringAsFixed(2)}'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        onClick();
      },
    );
  }
}
