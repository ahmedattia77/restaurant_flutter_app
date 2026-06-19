import 'package:flutter/material.dart';

class AddAllToCardButton extends StatelessWidget {
  final VoidCallback onClick;
  const AddAllToCardButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity , 50),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: const Text(
        'Add All To Card',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        onClick();
      },
    );
  }
}
