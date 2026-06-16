

import 'package:flutter/material.dart';

class AddToListButton extends StatelessWidget {
  final VoidCallback onClick ;
  const AddToListButton({super.key ,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, 
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18), 
                ),
                elevation: 6,
              ),
              child: const Text(
                'Add To Basket',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                onClick();
              },
            );
  }
}